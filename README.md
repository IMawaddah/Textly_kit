# Textly 🧰

**Textly** is a modular text-processing toolkit for the command line, written in Bash. It gives you an interactive, emoji-friendly menu for analyzing, cleaning and extracting data from plain-text files.

## Features

### 📊 Text Analysis (`tools/analyze_text.sh`)
- Total word count
- Count how many times a specific word appears
- Total line count

### 🧹 Text Cleaning (`tools/clean_text.sh`)
- Remove special characters (keeps letters, numbers and spaces)
- Remove empty lines
- Convert all text to lowercase

> **Warning:** the cleaning tool edits the file you give it **in place**. Work on a copy if you want to keep the original.

### 📤 Data Extraction (`tools/extract_data.sh`)
- Extract email addresses
- Extract phone numbers
- Extract the lines that contain a specific word

## Requirements

- Linux, macOS, or Windows with WSL / Git Bash
- Bash, plus standard tools (`grep`, `sed`, `tr`, `wc`), which are already installed on most systems

## Getting started

```bash
git clone https://github.com/IMawaddah/Textly_kit.git
cd Textly_kit
chmod +x main.sh
./main.sh
```

Choose a tool from the main menu, enter the path of a text file, and follow the prompts. Try it with the files in `samples/`:

| Sample file | Use it with |
|---|---|
| `samples/sample_to_analysis.txt` | Text Analysis |
| `samples/sample_to_clean.txt` | Text Cleaning (use a copy) |
| `samples/sample_to_extract.txt` | Data Extraction |

## Project structure

```
.
├── main.sh                 # Main menu
├── tools/
│   ├── analyze_text.sh     # Word and line counting
│   ├── clean_text.sh       # Text cleaning
│   └── extract_data.sh     # Email, phone and keyword extraction
└── samples/                # Example input files
```

## Contributors

This was a team project. See the [contributors page](https://github.com/IMawaddah/Textly_kit/graphs/contributors) for everyone who took part.
