#!/bin/bash  # Tell the system to use Bash to interpret this script

filename=$1  # Get the filename from the first command-line argument

# Check if the file exists, otherwise show an error and exit
if [[ ! -f "$filename" ]]; then
    echo "❌ File not found: $filename"
    exit 1
fi

# Infinite loop to keep showing the cleaning menu until the user exits
while true; do

    # Display the text cleaning menu
    echo "🧹 Text Cleaning Menu"
    echo "=============================="
    echo "1️⃣  Remove Special Characters   ❎"
    echo "2️⃣  Remove Empty Lines          📄🚫"
    echo "3️⃣  Convert to Lowercase        🔡"
    echo "4️⃣  Exit                        🚪"
    echo "=============================="

    # Prompt the user for a choice
    read -p "👉 Choose an option (1-4): " choice

    # Handle the user's choice
    case $choice in
        1)
            # Remove all characters except letters, numbers, and spaces
            sed -i 's/[^a-zA-Z0-9 ]//g' "$filename"
            echo "✅ Special characters removed from the file."
            echo "📄 Updated content:"
            cat "$filename"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        2)
            # Delete all empty lines or lines that contain only spaces/tabs
            sed -i '/^[[:space:]]*$/d' "$filename"
            echo "✅ Empty lines removed from the file."
            echo "📄 Updated content:"
            cat "$filename"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        3)
            # Convert all uppercase letters to lowercase safely
            cp "$filename" temp && tr '[:upper:]' '[:lower:]' < temp > "$filename" && rm temp
            echo "✅ All text converted to lowercase."
            echo "📄 Updated content:"
            cat "$filename"
            read -p "🔁 Press Enter to return to the menu..." dummy
            ;;
        4)
            # Exit the script with a goodbye message
            echo "👋 Exiting Text Cleaning Tool. Goodbye!"
            break
            ;;
        *)
            # Handle invalid input
            echo "⚠ Invalid option. Please choose a number between 1 and 4."
            read -p "🔁 Press Enter to try again..." dummy
            ;;
    esac

    echo ""  # Add a blank line for spacing
done
