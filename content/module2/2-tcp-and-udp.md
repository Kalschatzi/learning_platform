+++
title = "TCP and UDP - the building blocks of the internet"
type = ""
weight = 2
+++
 
There are two main protocols the internet is based on, TCP (Transmission Control Protocol) and UDP (User Datagram Protocol)
These are both layer 4 protocols.

## TCP - Transmission Control Protocol

TCP is the most widely used protocol. A lot of other protocols are based on it, including HTTP.
Key points:
* Connection-oriented – Establishes a connection before data transfer (via a three-way handshake: 
  * SYN (Synchronize) – Client sends a SYN packet to request a connection.
  * SYN-ACK (Synchronize-Acknowledge) – Server responds with SYN-ACK to acknowledge the request.
  * ACK (Acknowledge) – Client sends an ACK to confirm the connection is established.
* Reliable – Ensures all data is received in the correct order with retransmissions if packets are lost.
* Error checking – Uses checksums and acknowledgments to verify data integrity.
* Flow control – Adjusts data transmission speed based on network conditions.

TCP is used when you need a reliable connectivity without any packet loss.

If humans spoke with each-other following the TCP rules, it would look something like this:
{{< figure src="/images/module2/tcp-humans.png" >}}


### What protocols do I use that are TCP based?

* HTTP/S - Web browsing
* SMTP, IMAP, POP3 - Email
* FTP - File Transfer protocol
* SSH - Remote access

## UDP - User Datagram Protocol
Key points:
* Connectionless – No handshake; data is sent without establishing a connection.
* Fast but unreliable – No retransmissions or guaranteed order of delivery.
* Minimal overhead – Less processing and lower latency.

UDP is mainly used when speed and simplicity are prioritised over reliability, like Live Streaming (VoIP, video, online gaming). Video streaming services like Netflix will **not** use UDP as they have reliability as a requirement.
