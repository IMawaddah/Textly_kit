#!/bin/bash  # Tell the system to execute this script with Bash

filename=$1  # Get the first argument (the file path)

# Check if the file exists, otherwise show an error and exit
if [[ ! -f "$filename" ]]; then
    echo "❌ File not found: $filename"
    exit 1
fi

# Start an infinite loop to keep showing the menu until the user exits
while true; do

    # Display the text analysis menu
    echo "📝 Text Analysis Menu"
    echo "=============================="
    echo "1️⃣  Word Count              🧮"
    echo "2️⃣  Count Specific Word     🔍"
    echo "3️⃣  Line Count              📏"
    echo "4️⃣  Exit                    🚪"
    echo "=============================="

    # Prompt the user to choose an option
    read -p "👉 Select an option (1-4): " CHOICE

    case $CHOICE in
        1)
            # Option 1: Count the total number of words in the file
            echo "🧮 Total Word Count:"
            wc -w < "$filename"
            echo "------------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;

        2)
            # Option 2: Ask the user to enter a word to search for
            read -p "🔍 Enter the word to search for: " WORD
            COUNT=$(grep -o -i "\\b$WORD\\b" "$filename" | wc -l)  # Case-insensitive match
            echo "📌 The word '$WORD' occurred $COUNT times."
            echo "------------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        3)
            # Option 3: Count number of lines in the file
            echo "📏 Total Line Count:"
            wc -l < "$filename"
            echo "------------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        4)
            # Option 4: Exit the script
            echo "👋 Exiting Text Analysis. Goodbye!"
            break
            ;;
        *)
            # Handle invalid input
            echo "⚠️ Invalid option. Please enter a number between 1 and 5."
            read -p "🔁 Press Enter to try again..." dummy
            ;;
    esac
done
