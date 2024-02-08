# Common Linux Commands Cheat Sheet

Linux offers a wide range of commands for various operations, from file manipulation to system monitoring and user management. Here's an overview of some commonly used Linux commands:

## File and Directory Management

- **`ls`**: Lists files and directories in the current directory.
  ```
  ls -l    # Long listing format
  ls -a    # Includes hidden files
  ```
- **`cd`**: Changes the current directory.
  ```
  cd /path/to/directory    # Change to specified directory
  cd                       # Change to home directory
  cd ..                    # Move up one directory
  ```
- **`pwd`**: Displays the current directory path.
  ```
  pwd
  ```
- **`mkdir`**: Creates a new directory.
  ```
  mkdir directory_name
  ```
- **`rmdir`**: Removes a directory (must be empty).
  ```
  rmdir directory_name
  ```
- **`rm`**: Removes files or directories.
  ```
  rm file_name       # Remove a file
  rm -r directory_name  # Recursively remove a directory and its contents
  ```
- **`cp`**: Copies files or directories.
  ```
  cp source_file target_file
  cp -r source_directory target_directory
  ```
- **`mv`**: Moves or renames files or directories.
  ```
  mv old_name new_name    # Rename
  mv file_name /path/to/directory  # Move
  ```

## System Information and Management

- **`top`**: Displays real-time system processes and resource usage.
  ```
  top
  ```
- **`df`**: Shows disk space usage.
  ```
  df -h   # In human-readable form
  ```
- **`free`**: Displays memory usage.
  ```
  free -h  # In human-readable form
  ```
- **`uname`**: Shows system information.
  ```
  uname -a  # All system information
  ```
- **`whoami`**: Displays the current user.
  ```
  whoami
  ```

## User Management

- **`useradd`**: Creates a new user account.
  ```
  useradd username
  ```
- **`userdel`**: Deletes a user account.
  ```
  userdel username
  ```
- **`passwd`**: Changes a user's password.
  ```
  passwd username
  ```
- **`groups`**: Displays the groups a user belongs to.
  ```
  groups username
  ```
- **`su`**: Switches the current user account.
  ```
  su - username
  ```

## Process Management

- **`ps`**: Lists running processes.
  ```
  ps -ef   # Shows all processes
  ```
- **`kill`**: Terminates a process by PID (Process ID).
  ```
  kill PID
  ```
- **`killall`**: Terminates all processes with a given name.
  ```
  killall process_name
  ```
- **`bg`**: Resumes a stopped job in the background.
  ```
  bg job_id
  ```
- **`fg`**: Brings a job to the foreground.
  ```
  fg job_id
  ```
- **`jobs`**: Lists all jobs associated with the current terminal session.
  ```
  jobs
  ```

## Networking

- **`ping`**: Sends ICMP echo requests to a host.
  ```
  ping hostname_or_ip
  ```
- **`ifconfig`** (deprecated in favor of `ip`): Configures or displays network interface information.
  ```
  ifconfig   # Display interfaces
  ```
- **`ip`**: Show / manipulate routing, devices, policy routing and tunnels.
  ```
  ip addr show  # Display IP addresses and property information for all interfaces
  ```

For detailed information about any command, you can use the `man` command followed by the command name to read its manual page, e.g., `man ls`.
