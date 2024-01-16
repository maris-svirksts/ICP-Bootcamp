# Virtualization Stack Setup

This README describes the virtualization stack setup on my system, utilizing Windows 10 as the host operating system, Oracle VM VirtualBox as the hypervisor, and Ubuntu 22.04 (code-named Jammy) as the guest operating system.

## Virtualization Stack

The virtualization stack is structured as follows:

1. **Hardware (Bare Metal)**: This represents the physical computer's hardware, which is the actual machine where everything runs.

2. **Windows 10 (Host OS)**: Windows 10 is the primary operating system installed directly on the physical hardware of the computer, serving as the host for virtualization.

3. **Oracle VM VirtualBox (Hypervisor)**: Oracle VM VirtualBox is the hypervisor that runs on top of the Windows 10 host operating system. It enables you to create, configure, and manage virtual machines.

4. **Ubuntu Virtual Machine**: This represents the virtual machine created within Oracle VM VirtualBox. It is running Ubuntu 22.04 (code-named Jammy) as the guest operating system.

5. **Docker Container**: Docker is used to run containers on the Ubuntu virtual machine. Specifically, I've set up a Docker container to run the 'hello-world' application.

## Issues Encountered

During the setup process, I encountered the following issues:

1. **Boot Process Hangs at Level 3**: When using the default hypervisor settings, the Linux virtual machine got stuck at level 3 of the boot process. To resolve this, I increased the video memory allocated to the virtual machine.

2. **Terminal Console Issues**: After updating the system time (as it was initially set to GMT + 3 instead of GMT + 2), the terminal console stopped working. As a workaround, I installed XTerm to bypass this issue temporarily.

## Tasks

### Task 1

To monitor memory usage before and after running the following Docker command `docker run hello-world`, you can use the `free -mh` command. Here's what I observed:

- Before running the Docker image, the memory available was approximately 1.3 GiB.

- After running the Docker image, the memory available decreased to 893 MiB.

#### Analysis

Docker and the application 'hello-world' used about 459 MiB of the memory available. More than what I'd expect from a 'hello world' application.

### Task 2

I ran `free -mh` and `df -h` commands within the VM to further monitor system resources. Here's what I observed:

- Regarding VM memory:
  - The available memory was approximately 1.2 GiB.
- Regarding Host memory:
  - The available memory was 6129MB, total memory was: 16126MB

- Regarding VM disk space:
  - I did not find `sda1` as expected, but instead, there is `sda3` for data and `sda2` for swap.
  - `sda3` has a capacity of 49 GiB.
  - `sda2` has a capacity of 512 MiB.
- Regarding Host disk space:
  - Data (D:) disk that holds the VM Image has a capacity of 931GiB.
  - 112GiB of the Data (D:) capacity is available.

#### Analysis

Comparing the available memory with the previous task, it appears to be smaller. One possible explanation could be automatic updates or other background processes consuming memory, although this was not verified as it was not part of the assignment.

As for the disk space, the results match the expected values, with a total of 50 GiB made available for the VM image.

### Task 3

I gathered information about memory and disk space from both VirtualBox settings and the host operating system settings. Here are the details:

- Regarding VM disk space in VirtualBox settings:
  - Base memory allocated to the VM: 4096MB
  - Virtual size of the VM's hard disk: 50GB
  - Actual size of the VM's hard disk usage: 19.45GB

- Regarding Host disk space in the host operating system settings:
  - The Data (D:) disk that holds the VM Image has a capacity of 931GiB.
  - Out of the total capacity, 112GiB of the Data (D:) disk space is available.

#### Analysis

The results match the expected values.

## Misc

1. **Duplicates**: I dealt with 4 out of 6 images provided since the rest of them were duplicates that asked the same question except for a diffeent host OS.

2. **Note #1**: Rebooted the VM OS before each task to get the most independent results.

3. **Note #2**: I used ChatGPT 3.5 to add Markup language code and polish the content look and feel. Data and analysis is my own.
