+++
title = "OSI Model"
type = ""
weight = 1
+++
 
The OSI (Open Systems Interconnection) model is a conceptual framework used to understand how different networking protocols interact in a layered architecture. It standardizes network communication into seven layers, each responsible for a specific function. This model helps different systems communicate, ensuring interoperability between devices and software from different vendors.

## There are seven layers in the OSI model

### 1 - Physical Layer

* Deals with the physical transmission of data over a medium (cables, fiber optics, radio waves).
* Converts digital bits into electrical, optical, or radio signals.
* Includes hardware components like network cables, switches, and repeaters.

### 2 -Data Link Layer

* Ensures error-free transmission of data between two directly connected nodes.
* Divided into two sublayers:
* MAC (Media Access Control) – Controls access to the physical medium.
* LLC (Logical Link Control) – Manages frame synchronization and error checking.

Examples: Ethernet, Wi-Fi, MAC addresses.

### 3 -Network Layer

* Handles logical addressing and routing of packets between different networks.
* Uses IP addresses to determine the best path for data to travel.

Examples: IP (Internet Protocol), ICMP (ping), Routers.

### 4 - Transport Layer

* Ensures end-to-end communication and data integrity.
* Uses two main protocols which we will [cover in more detail next](2-tcp-and-udp):
  * TCP (Transmission Control Protocol) 
  * UDP (User Datagram Protocol)

Examples: TCP, UDP, ports (80 for HTTP, 443 for HTTPS).
 **NOTE** - You'll often read about TCP/IP referenced as a single protocol, because they are very coupled together on network routing, but it's actually 2 different layers: IP operates at Layer 3 (Network) and TCP functions at Layer 4 (Transport)."

### 5 - Session Layer

* Manages sessions (or connections) between applications.
* Controls session establishment, maintenance, and termination.

Example: NetBIOS, RPC (Remote Procedure Call).

### 6 - Presentation Layer

* Converts data into a format that the application layer can process.
* Handles data encryption, compression, and encoding.

Examples: SSL/TLS (encryption), JPEG, ASCII, MP3.

### 7 - Application Layer

* The closest layer to the end-user, enabling software applications to communicate over a network.
* Includes protocols for web browsing, email, file transfers, etc.

Examples: HTTP, HTTPS, FTP, SMTP, DNS.


For application development, you'll mostly deal with TCP/IP - Layers 3 and 4, and HTTP - Layer 7.
