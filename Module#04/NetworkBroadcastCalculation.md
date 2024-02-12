1. **172.28.0.17/8**
   - Network Address: `172.0.0.0`
   - Broadcast Address: `172.255.255.255`
   
2. **172.28.0.17/16**
   - Network Address: `172.28.0.0`
   - Broadcast Address: `172.28.255.255`
   
3. **172.28.0.17/24**
   - Network Address: `172.28.0.0`
   - Broadcast Address: `172.28.0.255`
   
4. **172.28.0.17/14**
   - Network Address: `172.28.0.0`
   - Broadcast Address: `172.31.255.255`
   
5. **172.28.0.17/23**
   - Network Address: `172.28.0.0`
   - Broadcast Address: `172.28.1.255`

### Description of the Calculation:

The network address is the first address in a subnet, where all the host bits are set to zero. The broadcast address is the last address in a subnet, where all the host bits are set to one.

When given an IP address with a CIDR notation (e.g., `172.28.0.17/8`), the calculation involves:

- Using the subnet mask (`/8`, `/16`, `/24`, `/14`, `/23`) to determine how many bits are used for the network part.
- The remainder of the bits (after the network bits) are used for host addresses within that network.
- The network address is formed by setting all host bits to `0`.
- The broadcast address is formed by setting all host bits to `1`.

In Python, the `ipaddress` module provides a convenient way to work with IP addresses and networks. The `ip_network` function creates a network object from the CIDR notation, which includes methods to retrieve the network address (`network_address`) and the broadcast address (`broadcast_address`). By setting `strict=False`, it allows the IP address provided to have non-zero host bits, which is typical when you're provided with an arbitrary IP within a subnet and want to calculate the network's parameters based on that.

For the subnet `172.28.0.17 255.192.0.0`, the calculation is not directly shown in the output above, as it wasn't included in the Python script due to its different format. However, if you need to calculate it, you can use the CIDR equivalent, which is `/10` for the subnet mask `255.192.0.0`. Here's how it would be calculated:

**172.28.0.17 255.192.0.0 (Equivalent to 172.28.0.17/10)**
- Network Address: `172.0.0.0`
- Broadcast Address: `172.63.255.255`