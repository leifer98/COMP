#include "tokens.hpp"
#include "output.hpp"
#include <string>

std::string handleStringToken(const char *yytext)
{
    std::string processedText = std::string(yytext);

    // Replace escape sequences with corresponding characters
    size_t pos;
    while ((pos = processedText.find("\\t")) != std::string::npos)
    {
        processedText.replace(pos, 2, "\t");
    }
    while ((pos = processedText.find("\\n")) != std::string::npos)
    {
        processedText.replace(pos, 2, "\n");
    }
    while ((pos = processedText.find("\\r")) != std::string::npos)
    {
        processedText.replace(pos, 2, "\r");
    }

    // Handle ASCII escape sequences (\xDD)
    while ((pos = processedText.find("\\x")) != std::string::npos)
    {
        // Ensure there are two characters following \x
        if (pos + 3 >= processedText.length())
        {
            output::errorUndefinedEscape("\\x"); // Handle incomplete sequence
            return "";
        }

        // Extract the two hexadecimal digits
        const char *hexValue = processedText.substr(pos + 2, 2).c_str();
        if (!isxdigit(hexValue[0]) || !isxdigit(hexValue[1]))
        {
            output::errorUndefinedEscape(processedText.substr(pos, 4).c_str()); // Handle invalid \xDD
            return "";
        }

        // Convert the hexadecimal string to an integer
        char asciiChar = static_cast<char>(std::stoi(std::string(hexValue), nullptr, 16));

        // Check if the character is printable
        if (!isprint(asciiChar))
        {
            output::errorUndefinedEscape(processedText.substr(pos, 4).c_str()); // Handle non-printable \xDD
            return "";
        }

        // Replace \xDD with the corresponding ASCII character
        processedText.replace(pos, 4, std::string(1, asciiChar));
    }

    // Handle undefined escape sequences
    while ((pos = processedText.find("\\")) != std::string::npos)
    {
        // Check if it is not a known escape sequence
        if (processedText[pos + 1] != 't' && processedText[pos + 1] != 'n' &&
            processedText[pos + 1] != 'r' && processedText[pos + 1] != 'x')
        {
            const char sequence[3] = {processedText[pos], processedText[pos + 1], '\0'}; // Capture undefined sequence
            output::errorUndefinedEscape(sequence);                                      // Call output::errorUndefinedEscape
            return "";
        }
    }

    // Remove enclosing quotes
    if (processedText.length() > 1 && processedText.front() == '"' && processedText.back() == '"')
    {
        processedText = processedText.substr(1, processedText.length() - 2);
    }

    return processedText;
}

void handleSequenceError(const char *yytext)
{
    std::string text(yytext);

    // Iterate through the string character by character
    for (size_t pos = 0; pos < text.length(); ++pos)
    {
        if (text[pos] == '\\') // Found an escape sequence
        {
            size_t remainingLength = text.length() - pos - 1; // Characters after '\'
            std::string sequence;

            // Collect up to 3 characters after '\'
            if (remainingLength >= 3)
            {
                sequence = text.substr(pos + 1, 3);
            }
            else if (remainingLength >= 2)
            {
                sequence = text.substr(pos + 1, 2);
            }
            else if (remainingLength >= 1)
            {
                sequence = text.substr(pos + 1, 1);
            }
            else
            {
                // No characters after '\' (malformed sequence)
                output::errorUndefinedEscape("\\");
                return;
            }

            // Remove trailing " if it exists in the sequence
            if (!sequence.empty() && sequence.back() == '"')
            {
                sequence.pop_back(); // Remove trailing "
            }

            // Validate the sequence
            char firstChar = sequence[0];

            // Check for \x (hexadecimal escape sequence)
            if (firstChar == 'x')
            {
                // Ensure there are two hex digits
                if (sequence.length() < 3 || sequence[1] < '0' || sequence[1] > '7' || !std::isxdigit(sequence[2]))
                {
                    output::errorUndefinedEscape(sequence.c_str());
                    return;
                }

                // Valid \xDD sequence, skip past it
                pos += 3; // Move past \xDD
                continue;
            }

            // Check for single-character escape sequences
            if (std::string("ntr\"0").find(firstChar) != std::string::npos)
            {
                // Valid single-character escape sequence, skip past it
                pos += 1;
                continue;
            }

            // Invalid single-character escape sequence
            output::errorUndefinedEscape(sequence.substr(0, 1).c_str()); // Only send the first invalid character
            return;
        }
    }
}

int main()
{
    enum tokentype token;

    // read tokens until the end of file is reached
    while ((token = static_cast<tokentype>(yylex())))
    {
        if (token == STRING)
        {
            std::string textWithoutQuotes = handleStringToken(yytext);
            output::printToken(yylineno, token, textWithoutQuotes.c_str());
        }
        else if (token == ERROR1)
        {
            output::errorUnknownChar(yytext[0]);
        }
        else if (token == ERROR2)
        {
            output::errorUnclosedString();
        }
        else if (token == ERROR3)
        {
            handleSequenceError(yytext);
        }
        else
        {
            output::printToken(yylineno, token, yytext);
        }
    }
    return 0;
}