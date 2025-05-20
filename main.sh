#!/bin/bash  # Tells the system to interpret the script using Bash

# Infinite loop to keep showing the menu until the user exits
while true; do

    # Display the main menu with emoji-enhanced options
    echo "🧰 Textly – Modular Text Processing Kit"
    echo "=============================="
    echo "1️⃣  Text Analysis     📊"
    echo "2️⃣  Text Cleaning     🧹"
    echo "3️⃣  Data Extraction   📤"
    echo "4️⃣  Exit              🚪"
    echo "=============================="
    
    # Prompt the user to select a tool
    read -p "👉 Please choose a tool [1-4]: " CHOICE

    # Process the user's choice
    case $CHOICE in
        1)
            # Prompt for a file path for analysis
            read -p "📂 Enter the file path to analyze: " filename
            # If the user entered an empty value, skip and go back to menu
            [[ -z "$filename" ]] && continue
            # Run the text analysis script with the file path as an argument
            bash tools/analyze_text.sh "$filename"
            read -p "🔁 Press Enter to return to the main menu..." dummy
            ;;
        2)
            # Prompt for a file path for cleaning
            read -p "📂 Enter the file path to clean: " filename
            [[ -z "$filename" ]] && continue
            bash tools/clean_text.sh "$filename"
            read -p "🔁 Press Enter to return to the main menu..." dummy
            ;;
        3)
            # Prompt for a file path for data extraction
            read -p "📂 Enter the file path to extract from: " filename
            [[ -z "$filename" ]] && continue
            bash tools/extract_data.sh "$filename"
            read -p "🔁 Press Enter to return to the main menu..." dummy
            ;;
        4)
            # Exit the loop and display a goodbye message
            echo "👋 Goodbye from Textly!"
            break
            ;;
        *)
            # Handle invalid menu options
            echo "❌ Invalid option! Please select a number between 1 and 4."
            read -p "🔁 Press Enter to try again..." dummy
            ;;
    esac
done
