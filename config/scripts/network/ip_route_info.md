
# https://tldp.org/HOWTO/Linux+IPv6-HOWTO/ch07s01.html

1. Displaying existing IPv6 routes

First you should check, whether and which IPv6 addresses are already configured (perhaps auto-magically during auto-configuration).
1.1. Using "ip"

Usage:

# /sbin/ip -6 route show [dev <device>]

Example:

# /sbin/ip -6 route show dev eth0
2001:0db8:0:f101::/64 proto kernel metric 256 mtu 1500 advmss 1440
fe80::/10             proto kernel metric 256 mtu 1500 advmss 1440
ff00::/8              proto kernel metric 256 mtu 1500 advmss 1440
default               proto kernel metric 256 mtu 1500 advmss 1440

1.2. Using "route"

Usage:

# /sbin/route -A inet6 

Example (output is filtered for interface eth0). Here you see different IPv6 routes for different addresses on a single interface.

# /sbin/route -A inet6 |grep -w "eth0"
2001:0db8:0:f101 ::/64 :: UA  256 0 0 eth0 <- Interface route for global
¬ address
fe80::/10        ::       UA  256 0 0 eth0 <- Interface route for link-local
¬ address
ff00::/8         ::       UA  256 0 0 eth0 <- Interface route for all multicast
¬ addresses
::/0             ::       UDA 256 0 0 eth0 <- Automatic default route
