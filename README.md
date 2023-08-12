# IP-Extractor
## Description
`ip-extractor.sh` is a simple yet powerful script allowing users to paste any text into the nano editor quickly. Once the content is provided, the script extracts IP addresses, efficiently filtering and saving them into the `hosts` file. Any duplicates are systematically removed, ensuring clean, unique entries. After processing, the results are promptly displayed on the console, providing an immediate overview of the extracted IPs. Whether dealing with logs, raw data dumps, or any text block, this tool is invaluable for swiftly capturing IP addresses.

## Prerequisites
- Bash environment (Linux/Unix/macOS)
- `nano` text editor

## Usage
1. Run the script:
\```bash
./ip-extractor.sh
\```
2. `nano` editor will open. Paste your text containing IP addresses.
3. Save and exit the editor.
4. The script processes the text, extracts IP addresses, and saves them in the `hosts` file.
5. Extracted IPs will be displayed on the console.

## Features
- Utilizes `nano` editor for easy text input.
- Efficient extraction of IP addresses.
- Removes duplicate IP entries.
- Displays the results on the console after processing.
