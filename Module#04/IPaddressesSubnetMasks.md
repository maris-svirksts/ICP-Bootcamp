# IP Addresses and Subnet Masks

An IP address is a unique identifier for a device on a network, consisting of two parts: the network portion and the host portion. A subnet mask is used to specify which part of the IP address belongs to the network portion and which part belongs to the host portion.

# Calculating Subnet Size

1. **Understand the Subnet Mask**: The subnet mask is typically written in dotted decimal notation like an IP address (e.g., 255.255.255.0) or in CIDR notation appended to the IP address (e.g., 192.168.1.0/24). Each 255 in the subnet mask represents a full byte (8 bits) of the network portion, and each 0 represents a full byte of the host portion.

2. **Convert Subnet Mask to Binary**: Convert the subnet mask to its binary form to easily see the division between the network and host portions. For example, 255.255.255.0 converts to 11111111.11111111.11111111.00000000.

3. **Calculate the Number of Hosts**: Subtract the number of bits used for the network portion from 32 (the total number of bits in an IPv4 address) to get the number of bits for the host portion. Use the formula `2^n - 2` to calculate the number of usable host addresses within the subnet, where `n` is the number of bits in the host portion. The subtraction of 2 accounts for the network address and the broadcast address, which cannot be assigned to hosts.

# Determining the Network and Broadcast Address

- **Network Address**: The network address is determined by performing a bitwise AND operation between the IP address and the subnet mask. It represents the start of the subnet and is not assignable to any device.

- **Broadcast Address**: The broadcast address is found by inverting the subnet mask (turning all the network bits to 0 and the host bits to 1) and performing a bitwise OR operation with the IP address. This address is used to send messages to all devices on the subnet.

# Example

Given an IP address of 192.168.1.10 with a subnet mask of 255.255.255.0 (/24):

1. **Subnet Mask in Binary**: 11111111.11111111.11111111.00000000
2. **Number of Host Bits**: 32 - 24 = 8
3. **Number of Usable Hosts**: `2^8 - 2` = 254
4. **Network Address**: 192.168.1.0 (the lowest address in the range)
5. **Broadcast Address**: 192.168.1.255 (the highest address in the range)

# CIDR Notation and Subnetting

CIDR (Classless Inter-Domain Routing) notation is a compact representation of an IP address and its associated network mask. CIDR allows for flexible subnetting beyond the traditional class-based network definitions. To subnet a network in CIDR:

1. Determine the required number of subnets or hosts.
2. Calculate the appropriate subnet mask to accommodate this requirement, often involving dividing a larger network into smaller subnets.
3. For each subnet, calculate the network address, usable IP range, and broadcast address as outlined above.

Subnetting allows network administrators to optimize the usage of IP addresses according to the specific needs of their networks, improving efficiency and security.

Understanding these concepts and calculations is crucial for network design, troubleshooting, and management, ensuring efficient and effective IP address allocation and network segmentation.