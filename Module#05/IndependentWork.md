# Bash Shell.

## The Task

Create a Bash script that processes a list of files in a directory. The script should:
 1.	Start by checking if the directory exists. If not, print an error message and exit.
 2.	Use a while loop to iterate through each file in the directory.
 3.	Inside the loop, use an if statement to check if the current item is a file or a directory.
 4.	If it’s a file, use a case statement to determine its file type (e.g., text file, image, script).
 5.	For text files, print the first three lines. For images, display a message about its format. For script files, check if they are executable and print whether they are or not.
 6.	If it’s a directory, print a message indicating that and recursively process the contents of that directory.
 7.	Implement an elif statement to handle cases where the item is neither a file nor a directory and print an appropriate message.
 8.	Use a counter to keep track of the number of files processed and print the total count at the end.

## The Results

### Overview
This script processes a list of files and directories within a specified directory. It performs the following actions:
- Checks if a given directory exists; if not, it outputs an error and exits.
- Iteratively goes through each item (file or directory) in the provided directory.
- For files, it determines the file type and takes actions based on the type:
  - For text files (`.txt`), it prints the first three lines.
  - For image files (`.png`, `.gif`, `.jpg`, `.jpeg`), it displays a message about the file format.
  - For script files (`.sh`), it checks if they are executable and prints their status.
- For directories, it prints a message indicating it's a directory and then recursively processes its contents.
- Uses a counter to track the total number of files processed and prints this count at the end.


### Usage

```bash
./independentTask.sh [directory_path]
```

### Requirements
- Bash shell
- Necessary permissions to access and read the files and directories you want to process.

### Error Handling
- Checks if the script is provided with exactly one argument (expected to be a directory path).
- Verifies the existence of the provided directory.

### Sourcecode
```bash
#!/bin/bash

# Setting up color variables for output formatting: https://stackoverflow.com/questions/16845699/bash-colour-one-word-using-echo
textreset=$(tput sgr0) # Reset the foreground color to default
col1=$(tput setaf 1)   # Set color 1 (red)
col2=$(tput setaf 2)   # Set color 2 (green)

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    # Print error in red if the argument count is not equal to one
    echo "${col1}ERROR:${textreset} Invalid Argument Count"
    exit 1
elif [ ! -d "$1" ]; then
    # Print error in green if the provided argument is not a directory
    echo "${col2}ERROR:${textreset} $1 is not a directory."
    exit 1
fi

# Informative echo about the script's task
echo "Independent task: A Bash script that processes a list of files in a directory."
echo $'\n'

# Function to process files in a given directory
check_directory() {
    local directory=$1      # The directory to process
    local file_count=0      # Counter for the number of files processed
    local current_subdirectory=""  # Variable to store the subdirectory being processed

    # Read each item found by 'find'
    while read -r item; do
        # Check and reset current_subdirectory if not processing a subdirectory
        if [[ -n "$current_subdirectory"  && ${item} != *"$current_subdirectory"*  && ! -d "$item" ]]; then
            echo $'\n'
            current_subdirectory=""
        fi

        # Check if the item is a file
        if [ -f "$item" ]; then
            # Determine the type of file and process accordingly
            case "$item" in
                *.txt)
                    # If it's a text file, print its first three lines
                    echo "${col2}Text File:${textreset} $item"
                    head -n 3 "$item"
                    ;;
                *.png | *.gif | *jpg | *jpeg)
                    # If it's an image file, just display its name
                    echo "${col2}Image File:${textreset} $item"
                    ;;
                *.sh)
                    # If it's a script file, check if it's executable
                    if [ -x "$item" ]; then
                        echo "${col2}Executable:${textreset} $item"
                    else
                        echo "${col2}Non-Executable:${textreset} $item"
                    fi
                    ;;
                *)
                    # If file type is not recognized
                    echo "${col2}Extension not added:${textreset} $item"
                    ;;
            esac
            (( file_count++ ))  # Increment the file counter
        elif [ -d "$item" ]; then
            # If the item is a directory
            echo $'\n'
            echo "${col1}Directory:${textreset} $item"
            current_subdirectory=$item  # Update current_subdirectory
        else
            # If the item is neither a file nor a directory
            echo "$item is neither a file or a directory."
        fi

    # Use 'find' to list items in the directory, skipping the top directory
    # 'sort' is used to process files before directories
    done < <(find "$directory" -mindepth 1 | sort)

    # Print the total number of files processed
    echo $'\n'
    echo "Directory: $directory; Total files processed: $file_count"
}

# Call the function with the provided directory
check_directory "$1"

```