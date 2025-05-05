+++
title = "Networking Concepts"
type = ""
weight = 5
+++
 
# IP Addresses
## What is an IP?

An IP address (Internet Protocol address) is a unique identifier for a device on a network. It’s like a street address for your computer.
There are two types:

## IPv4 
Most common. Format: xxx.xxx.xxx.xxx (e.g. 192.168.1.10)
Each part is called an octet (range: 0 to 255)

This uses 32-bit addresses.
This means there are 2³² = 4,294,967,296(~4.3 billion) possible unique IPv4 addresses.

**Example:** 192.168.1.1

Considering there are 8 billion people on earth, this number feels short. Which is why there is an IPv4 exhaustion.

### IPv4 Exhaustion

It means we’re running out of IPv4 addresses because:
* Too many devices need IPs (phones, computers, smart devices, etc.)
* IPv4 only allows ~4.3 billion unique addresses.
* Many IPs are reserved or wasted (e.g., private networks, multicast, etc.)

So the number of usable public IPv4 addresses is even lower.

How do we solve this?

#### NAT (Network Address Translation)
* Lets multiple devices share one public IP.
* Used in home routers and corporate networks.
* Buys time, but not a long-term fix.

Your own home has a single public IP that is accessible to the internet, but there you'll have multiple devices with internet connectivity like computer, smartphones etc. There you'll have your own **LAN**.

#### IPv6 – Newer, longer format

This replaces IPv4 with a much larger address space.
The format is 128 bits → 2¹²⁸ = **340 undecillion addresses** (That’s 340 trillion trillion trillion)

**Example IPv6:**  `2001:0db8:85a3:0000:0000:8a2e:0370:7334`

There are multiple benefits from using this, but the main driver as why it's not the standard yet it's because no all devices yet support this.


## What is a LAN (Local Area Network)

A LAN connects devices within a small area, like your home. You'll have a LAN that will connect to the WAN (World Area Network) via the router.
This will be a private network, only accessible on the devices of that same network. It will use private IP, so no need to worry about IPv4 exhaustion. Yes, each device will still have an IP which will be handled by router.

### What services are in a LAN
You router will be the entry and exit point of your network to the internet. All traffic initiating from your devices will be allowed, but traffic coming in will be denied by the **router's firewall**
Your router also has the responsibility of assigning IP addressed to the devices connected to it. This is done with a **DHCP** server inside the router.

It will also provide a **DNS* for internet resolutions and as a cache, so not all DNS request need to go to a DNS server.

## DNS (Domain Name System) servers 
DNS Servers  translate domain names (like `kalschatzi.com`) into IP addresses (like `172.67.199.164`), so computers can locate each other on the internet. 

### Why DNS is Needed

This builds a bridge between humans and machines. Humans remember names, machines care about actual address like IPs. This will be even more true once the whole world adopts IPv6.

### How DNS works
Let's say we try to resolve `learn.kalschatzi.com`. What are the steps taken to do it?
* Browser checks cache – Is the IP already known?
* If not, it asks the local DNS server (usually from your ISP or router).
* If that server doesn’t know, it queries:
  * Root DNS server → tells it where .com servers are
  * TLD server (Top-Level Domain, like .com) → tells where example.com is
  * Authoritative DNS server for example.com → gives the IP
  * The IP is returned to your browser → it connects to the site.

All of this takes a few milliseconds.

### What are the different DNS records.
Once we resolve a DNS, it can be of different types. Like:
|Record type| Purpose | Example|
|-----------|---------|--------|
|A|Maps domain → IPv4 address|kalschatzi.com ->172.67.199.164|
|AAAA|Maps domain → IPv6 address|kalschatzi.com ->2001:0db8:85a3:0000:0000:8a2e:0370:7334|
|CNAME|Alias (maps name → another name|learn.kalschatzi.com -> kalschatzi.com which then would map to 172.67.199.164|
|MX|Mail server for the domain|mail.kalschatzi.com ->172.67.199.164|
|NS|Domain Name server |ns1.kalschatzi.com -> this can be use for DNS delegation|
|TXT|Misc data (SPF, DKIM, etc.)|Used for email/security or just information|

## Let's resolve an IP!
```bash
nslookup kalschatzi.com
```
If I execute this, the output will looks something like:
```bash
Server:		192.168.2.1
Address:	192.168.2.1#53

Non-authoritative answer:
Name:	learn.kalschatzi.com
Address: 104.21.21.170
Name:	learn.kalschatzi.com
Address: 172.67.199.164
```


What does it mean?
* First 2 lines are what was the DNS. **192.168.2.1** is the router's IP address, and 53 is the default DNS Server port.
* We have then the line **Non-authoritative answer:**. This means the IP was cached, either at your router's internal DNS server, or at what DNS Server it called (the ISP by default, or something else in case you chaged it). If it were not, the response would have **Authoritative answer**, meaning it went straight to the DNS Server that owns the domain. This might be rare because everything is cached by to make queries faster.
* It then provides 2 distinct addresses that the client can pick to call. This often means that the server is behind a [CDN](https://www.cloudflare.com/learning/cdn/what-is-a-cdn/) like cloudflare.
