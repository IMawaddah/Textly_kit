#!/bin/bash  # This line tells the system to run the script using Bash

filename=$1  # Store the first command-line argument as the filename

# Check if the file does not exist or is not a regular file
if [[ ! -f "$filename" ]]; then
    echo "❌ File not found: $filename"  # Print error message
    exit 1  # Exit the script with a non-zero status (indicates error)
fi

# Infinite loop to display the menu until the user chooses to exit
while true; do
    
    # Print the main menu with options
    echo "📤 Data Extraction Menu"
    echo "============================"
    echo "1️⃣  Extract Emails       📧"
    echo "2️⃣  Extract Phone Numbers 📞"
    echo "3️⃣  Extract lines with specific word 🔎"
    echo "4️⃣  Exit                  🚪"
    echo "============================"
    
    # Prompt the user to choose an option
    read -p "👉 Choose an extraction type [1-4]: " CHOICE

    # Handle the user's choice
    case $CHOICE in
        1)
            echo "📧 Extracting email addresses..."
            # Use regex to extract emails 
            echo "----------------------------"
            echo "✅ Results: "
            # Display the extracted Email addresses
            grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" "$filename" || echo "⚠️ No emails found."
            echo "----------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        2)
            echo "📞 Extracting phone numbers..."
            # Use regex to extract phone numbers 
            echo "----------------------------"
            echo "✅ Results: "
            # Display the extracted phone numbers
            grep -E -o "\+?[0-9]{2,3}[- ]?[0-9]{2,3}[- ]?[0-9]{4,}" "$filename" || echo "⚠️ No phone numbers found."
            echo "----------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        3)
            # Ask the user for a keyword to search
            read -p "🔎 Enter the word to search for: " WORD
            echo "Searching for lines with: '$WORD'"
            echo "📄 Lines containing '$WORD':"
            echo "--------------------------"
            # Find all lines that contain the word (case-insensitive) 
            grep -i "$WORD" "$filename" || echo "⚠️ No matching lines found."
            echo "----------------------------"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        4)
            echo "👋 Exiting Data Extraction. Goodbye!"  # Farewell message
            break  # Exit the loop and end the script
            ;;
        *)
            echo "❌ Invalid option. Please choose between 1 and 4."  # Handle invalid inputs
            read -p "🔁 Press Enter to try again..." dummy
            ;;
    esac
done
