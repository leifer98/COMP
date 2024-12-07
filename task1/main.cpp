#include "tokens.hpp"
#include "output.hpp"
#include <string>
#include <iostream>

bool isValidHex(std::string hexSequence, char& hexAsChar) {
    // Validate length:
    if (hexSequence.length() != 2) {
        return false;
    }

    // Check it's really hex digits:
    if (!isxdigit(hexSequence[0]) || !isxdigit(hexSequence[1])) {
        return false;
    }

    // Convert the hexadecimal string to a char:
    char asciiChar = static_cast<char>(std::stoi(std::string(hexSequence), nullptr, 16));

    // Check if the character is valid (printable or whitespace character):
    bool isValid = false;

    std::string whitespaceCharacters = "\n\r\t ";
    for (int i=0; i<whitespaceCharacters.length(); i++) {
        if (asciiChar == whitespaceCharacters[i]) {
            isValid = true;
        }
    }
    if (isprint(asciiChar)) {
        isValid = true;
    }
    
    if (!isValid) {
        return false;
    }

    // If we got here, the hex is valid:
    hexAsChar = asciiChar;
    return true;
}

std::string handleStringToken(const char *yytext)
{
    std::string processedText = std::string(yytext);

    // Replace escape sequences with corresponding characters and handle non-valid ones
    int arrayLength = 6;
    std::string escapeStrings[arrayLength] = {"\\\\", "\\\"", "\\n", "\\r", "\\t", "\\0"};
    char replaceCharacters[arrayLength] = {'\\', '\"', '\n', '\r', '\t', '\0'};

    // Replace escape sequences with corresponding characters
    size_t pos;
    for (int i=0; i<arrayLength; i++) {
        while ((pos = processedText.find(escapeStrings[i])) != std::string::npos)
        {
            processedText.replace(pos, 2, std::string(1, replaceCharacters[i]));
        }
    }
    
    // Handle ASCII escape sequences (\xDD)
    while ((pos = processedText.find("\\x")) != std::string::npos)
    {
        int lengthToEnd = processedText.length() - pos - 2;
        int sequenceLength = lengthToEnd < 2 ? lengthToEnd : 2;
        std::string hexSequence = processedText.substr(pos + 2, sequenceLength);
        char hexAsAscii;
        if (!isValidHex(hexSequence, hexAsAscii)) {
            output::errorUndefinedEscape(("x" + hexSequence).c_str()); // Handle incomplete sequence
            return "";
        }

        // Replace \xDD with the corresponding ASCII character
        processedText.replace(pos, 4, std::string(1, hexAsAscii));
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
        else if (token == ERROR_UNKNOWN_CHAR)
        {
            output::errorUnknownChar(yytext[0]);
        }
        else if (token == ERROR_UNCLOSED_STRING)
        {
            output::errorUnclosedString();
        }
        else if (token == ERROR_UNDEF_ESCAPE)
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