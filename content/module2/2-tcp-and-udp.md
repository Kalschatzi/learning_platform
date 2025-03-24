+++
title = "TCP and UDP - the building blocks of the internet"
type = ""
weight = 2
+++
 
There are 2 main protocols the internet is based on, TCP(Transmission Control Protocol) and UDP (User Datagram Protocol)

## TCP - Transmission Control Protocol

The most widely used protocol, having lots of other protocols based on it, like http.
Key points:
* Connection-oriented – Establishes a connection before data transfer (via a three-way handshake: 
  * SYN (Synchronize) – Client sends a SYN packet to request a connection.
  * SYN-ACK (Synchronize-Acknowledge) – Server responds with SYN-ACK to acknowledge the request.
  * ACK (Acknowledge) – Client sends an ACK to confirm the connection is established.
* Reliable – Ensures all data is received in the correct order with retransmissions if packets are lost.
* Error checking – Uses checksums and acknowledgments to verify data integrity.
* Flow control – Adjusts data transmission speed based on network conditions.

This is used anywhere you need a reliable connectivity without any packet loss.

If humans spoke with each-other following the TCP rules, it would look something like this:
{{< figure src="/images/module2/tcp-humans.png" >}}


### What protocols do I use that are TCP based?

* HTTP/S - Used for web browsing
* SMTP, IMAP, POP3 - email
* FTP - File Transfer protocol
* SSH - remote access

## UDP - User Datagram Protocol
Key points:
* Connectionless – No handshake; data is sent without establishing a connection.
* Fast but unreliable – No retransmissions or guaranteed order of delivery.
* Minimal overhead – Less processing and lower latency.

This is mainly used for when reliability is not a top priority like Live Streaming (VoIP, video, online gaming). Video streaming services like Netflix will **not** use UDP as they have reliability as a requirement.
