# Expanded Common Linux Commands Cheat Sheet

In addition to the basic commands, here are more advanced and equally essential commands for deeper Linux usage.

## File Searching

- **`find`**: Searches for files and directories based on conditions.
  ```
  find /path/to/search -name filename.txt    # Find a file by name
  find /path/to/search -type d               # Find directories
  find /path/to/search -type f -size +2M     # Find files larger than 2MB
  ```
- **`grep`**: Searches text using patterns.
  ```
  grep 'pattern' filename      # Search for a pattern in a file
  grep -r 'pattern' /path/to/search  # Recursively search for a pattern in directory
  ```

## System Monitoring and Performance

- **`htop`**: An interactive process viewer, similar to `top`, but more user-friendly with a rich display.
  ```
  htop
  ```
- **`vmstat`**: Reports virtual memory statistics.
  ```
  vmstat
  ```
- **`iostat`**: Reports CPU statistics and input/output statistics for devices and partitions.
  ```
  iostat
  ```
- **`netstat`**: Displays network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
  ```
  netstat -tuln
  ```

## Network Troubleshooting

- **`traceroute`**: Traces the route packets take to a network host.
  ```
  traceroute hostname
  ```
- **`dig`**: Queries DNS name servers for information about host addresses, mail exchanges, name servers, and related information.
  ```
  dig domain.com
  ```
- **`nslookup`**: Queries Internet domain name servers. `nslookup` has two modes: interactive and non-interactive.
  ```
  nslookup domain.com
  ```

## Text Processing

- **`awk`**: A powerful programming language for working on files.
  ```
  awk '/pattern/ {action}' filename
  ```
- **`sed`**: A stream editor for filtering and transforming text.
  ```
  sed 's/old/new/' filename
  ```
- **`cut`**: Removes sections from each line of files.
  ```
  cut -d':' -f1 /etc/passwd
  ```
- **`sort`**: Sorts lines of text files.
  ```
  sort filename
  ```
- **`uniq`**: Reports or omits repeated lines.
  ```
  uniq filename
  ```
- **`diff`**: Compares files line by line.
  ```
  diff file1 file2
  ```

## File Compression and Archiving

- **`tar`**: Stores and extracts files from a tape or disk archive.
  ```
  tar cvf archive_name.tar /path/to/directory  # Create archive
  tar xvf archive_name.tar                    # Extract archive
  ```
- **`gzip`**, **`gunzip`**: Compress or expand files.
  ```
  gzip filename       # Compress
  gunzip filename.gz  # Decompress
  ```
- **`zip`**, **`unzip`**: Package and compress (archive) files.
  ```
  zip archive_name.zip files   # Compress
  unzip archive_name.zip       # Decompress
  ```

## Disk Usage

- **`du`**: Estimates file space usage.
  ```
  du -sh /path/to/directory   # Display human-readable summary
  ```

## Permissions and Ownership

- **`chown`**: Changes file owner and group.
  ```
  chown user:group filename
  ```
- **`chmod`**: Changes file mode (permissions).
  ```
  chmod 755 filename
  ```

## Symbolic Links

- **`ln`**: Creates hard and symbolic links.
  ```
  ln -s target link_name   # Create symbolic link
  ```

## Manual and Help

- **`man`**: Displays the manual page for commands.
  ```
  man command
  ```
- **`info`**: Displays a command's info entry.
  ```
  info command
  ```
- **`--help`**: Most commands support the `--help` option to display usage information.
  ```
  command --help
  ```
