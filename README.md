# File Organizer - Minimal Bash CLI

A simple, lightweight Bash script to organize files in a directory into subfolders based on their extensions.

---

## Features

- Automatically sorts all files into folders named by their extension.
- Files without an extension go into a `no_extension` folder.
- Minimal dependencies: works with standard Bash only.
- Safe and portable: handles errors and non-existent directories.

---

## Usage

```bash
./organize.sh <input_directory> <output_directory>
```

---

## Example

```bash
./organize.sh ~/Downloads ~/Organized
```

- This will create subfolders inside ~/Organized like:

```bash
Organized/
├── pdf/
├── jpg/
├── mp4/
└── no_extension/
```

- Files will be moved to the corresponding folders based on their extensions.


---


### How It Works

- Validates input and output directories.

- Iterates over each file in the input directory.

- Detects file extension using Bash parameter expansion.

- Moves file into a folder named after its extension (creates folder if necessary).

- Files without extension go into no_extension/.

---


### Requirements

- Bash shell (tested on Bash 4+)

- Standard Unix utilities (mv, mkdir, etc.)

---


### Notes

- Uses set -e to exit immediately on errors.

- Uses [[ ]] and parameter expansion (${BASENAME##*.}) for efficient extension detection.

- Designed to be minimal, readable, and easy to extend.

### License

- MIT License
