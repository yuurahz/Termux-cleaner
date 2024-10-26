## About Tools

Termux Junk Cleaner is a powerful junk cleanup tool designed to optimize and declutter your Termux environment. It offers a comprehensive set of features to clean up various unnecessary files, logs, cached data and more.

## Installation

- #### Clone the repository:
```bash
git clone https://github.com/yuurahz/Termux-cleaner
````
- #### Navigate to the project directory:
```bash
cd Termux-cleaner
```
- #### Give executable permission to the file
```bash
chmod +x cleaner.sh
```
- #### Run the script:
 ```bash
 ./cleaner.sh
```

## Features

- #### Selective Cleanup:
Choose specific cleanup options tailored to your needs (cached packages, temporary files, logs).

- ##### Cache Cleanup: Remove redundant cache files to free up space.
- ##### Cached Packages Cleanup: Efficiently clean cached packages to enhance performance.
- ##### Unused Packages Removal: Safely remove unnecessary or unused packages.
- ##### Temporary Files Cleanup: Eliminate temporary files that may accumulate over time.
- ##### Temporary Backup Files Cleanup: Ensure a clean slate by removing temporary backup files.
- ##### Unnecessary Logs Cleanup: Improve system cleanliness by cleaning unnecessary logs.

- #### Detailed Logs:
The tool generates cleanup details in cleanup_log.txt.

## Usage
Termux Junk Cleaner provides a flexible and user-friendly interface for cleanup operations. You can choose specific cleanup options, or run it interactively for a customized cleanup.
### Options

Interactive Mode:
```bash
./cleaner.sh
```
Help:
```bash
./cleaner.sh -h
```
Clean Cache Files:
```bash
./cleaner.sh -c
```
Clean Cached Packages:
```bash
./cleaner.sh -p
```
Remove Unnecessary Packages:
```bash
./cleaner.sh -n
```
Clean Temporary Files:
```bash
./cleaner.sh -t
```
Clean Temporary Backup Files:
```bash
./cleaner.sh -b
```
Clean Unnecessary Logs:
```bash
./cleaner.sh -l
```
Clean All Types of Junks:
```bash
./cleaner.sh -a
```
