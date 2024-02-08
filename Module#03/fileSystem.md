# Understanding the Linux File System

The Linux file system is organized in a hierarchical structure, starting from the root (`/`). Here's an overview of its directory structure and a brief explanation of each directory's purpose.

## Tree Structure

```
/
├── bin    # Essential User Binaries
├── boot   # Static Boot Files
├── dev    # Device Files
├── etc    # Configuration Files
│   ├── apache2
│   ├── ssh
│   ├── sysconfig
│   └── ...
├── home   # Home Directories
│   ├── user1
│   ├── user2
│   └── ...
├── lib    # System Libraries
├── media  # Removable Media
├── mnt    # Mount Directory
├── opt    # Optional add-on Applications
├── proc   # Process Information
├── root   # Root Home Directory
├── run    # Run-time Variable Data
├── sbin   # System Binaries
├── srv    # Service Data
├── sys    # System Files
├── tmp    # Temporary Files
├── usr    # User Binaries & Program Data
│   ├── bin
│   ├── lib
│   ├── local
│   │   ├── bin
│   │   └── lib
│   └── share
│       ├── doc
│       ├── man
│       └── ...
└── var    # Variable Data Files
    ├── log
    ├── mail
    ├── spool
    └── tmp
```

This tree structure illustrates the Linux file system's directories and some common subdirectories.

## Directory Descriptions

Each directory has a specific purpose:

- **/bin and /usr/bin**: Essential user command binaries that need to be available in single user mode; for all users, e.g., cat, ls, cp.
- **/boot**: Static files of the boot loader.
- **/dev**: Device files.
- **/etc**: Host-specific system configuration.
- **/home**: User home directories.
- **/lib and /usr/lib**: Essential shared libraries and kernel modules.
- **/media**: Mount point for removable media.
- **/mnt**: Mount point for mounting a filesystem temporarily.
- **/opt**: Add-on application software packages.
- **/proc**: Virtual filesystem documenting kernel and process status as text files.
- **/root**: Home directory for the root user.
- **/run**: Temporary filesystem for system runtime data.
- **/sbin and /usr/sbin**: Essential system binaries, e.g., fsck, init, route.
- **/srv**: Data for services provided by the system.
- **/sys**: Virtual filesystem providing access to kernel and hardware device information.
- **/tmp**: Temporary files.
- **/usr**: Secondary hierarchy for read-only user data; contains the majority of (multi-)user utilities and applications.
- **/var**: Variable files—files whose content is expected to continually change during normal operation of the system, such as logs, spool files, and temporary e-mail files.

## File Types in Linux

- **Regular files (-)**: Text files, binary files, or any misc files.
- **Directory files (d)**: Files that are actually directories.
- **Link files (l)**: The link files or shortcuts to another file.
- **Block device files (b)**: Used for device files that support buffering.
- **Character device files (c)**: Used for device files that do not support buffering.
- **Socket files (s)**: Used for networking.
- **Named pipe files (p)**: Acts as a pipeline between two processes.

## Understanding Linux Permissions

In Linux, each file and directory has three types of permissions:

- **Read (r)**: The read permission allows users to view the contents of the file.
- **Write (w)**: The write permission allows users to modify or delete the file.
- **Execute (x)**: The execute permission allows users to run the file as a program or script.

These permissions can be set for three different user classes:

- **User (u)**: The owner of the file.
- **Group (g)**: The group that the file belongs to.
- **Others (o)**: Everyone else who is not the owner or part of the group.

### Viewing Permissions

To view the permissions of files and directories, you can use the `ls -l` command, which displays permissions in the following format:

```
drwxr-xr-x 5 user group 4096 Jan 1 12:34 example
```

In this example:
- The first character indicates the type of file (e.g., `-` for a regular file, `d` for a directory).
- The next three characters (`rwx`) show the permissions for the user (owner).
- The following three (`r-x`) are for the group.
- The last three (`r-x`) are for others.

### Modifying Permissions

Permissions can be modified using the `chmod` command in two ways: symbolic mode and numeric (or octal) mode.

#### Symbolic Mode

The symbolic mode uses letters to represent users (`u`, `g`, `o`, `a` for all) and operations (`+` to add, `-` to remove, `=` to set exactly). For example:

- To add execute permission for the owner: `chmod u+x filename`
- To remove write permission for others: `chmod o-w filename`
- To set the permissions for the owner to read and execute only: `chmod u=rx filename`

#### Numeric Mode

The numeric mode uses numbers to represent permissions:
- **4** represents read (r),
- **2** represents write (w),
- **1** represents execute (x),
- **0** represents no permission.

Permissions are a sum of these numbers for each user class, creating a three-digit number. For example:
- **755** (`rwxr-xr-x`): Read, write, and execute for the owner; read and execute for group and others.
- **644** (`rw-r--r--`): Read and write for the owner; read-only for group and others.

### Special Permissions

In addition to the basic permissions, Linux supports special permissions:

- **Set User ID (SUID)**: When applied to an executable file, the file will execute as the user who owns the file, not the user who launched it.
- **Set Group ID (SGID)**: Similar to SUID but for groups. When applied to a directory, files created within it inherit the directory's group.
- **Sticky Bit**: Often used on directories, such as `/tmp`, to allow anyone to create files but only the owner (and root) can delete them.
