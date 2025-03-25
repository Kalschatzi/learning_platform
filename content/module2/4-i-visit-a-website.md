+++
title = "What happens when I enter a URL on a browser?"
type = ""
weight = 3
+++
 
 When you input a URL (Uniform Resource Locator) into a browser, a series of processes occur to retrieve the requested resource (like a webpage). Here are all the steps:

 ### 1 - User Enters URL

 You type a URL (e.g., https://learn.kalschatzi.com) into the browser’s address bar.

 ### 2 - DNS Resolution (Domain Name System)

 DNS Lookup: The browser first checks if the domain (e.g., learn.kalschatzi.com) is already cached from previous visits. If not, it queries a DNS server to resolve the domain name into an IP address (e.g., 192.0.2.1).
 * DNS Server Query: If the browser doesn’t have the IP cached, it asks DNS servers to find the IP address for the domain.
 * Recursive Lookup: If the DNS server doesn’t have the IP address, it will query other DNS servers in a hierarchical order until it finds the correct IP address.

 ### 3 - Establishing a Connection (TCP/IP)

 TCP Connection: Using the resolved IP address, the browser establishes a TCP connection with the web server via the Transmission Control Protocol (TCP) using the Three-Way Handshake.

 ### 4 - TLS/SSL Handshake (if HTTPS)

If the URL starts with `https://` (secure), the browser initiates a TLS/SSL handshake to encrypt the connection.
* The server sends its SSL/TLS certificate to the browser to verify its identity (using a trusted certificate authority).
* The browser and server agree on an encryption method and establish a secure connection to prevent eavesdropping and tampering.

### 5 - HTTP Request
HTTP Request: The browser sends an HTTP request to the web server, asking for the resource (the webpage). 
The request contains the URL, HTTP method (GET), headers (e.g., user-agent, cookies), and other relevant data.
**When you enter a URL in the browser's address bar, the browser always sends a GET request**

### 6 - Web Server Processes Request

The web server processes the HTTP request and prepares a response. It may involve fetching data from a database, running server-side code (like Java with SpringBoot), or directly serving static files.

### 7 - HTTP Response

The server sends back an HTTP response with the content.

### 8 - Browser Processes Response

Once the browser receives the HTML:
* It parses the HTML document.
* It identifies and sends requests for external resources like CSS files, images, JavaScript files, etc.

### 9 - Rendering Resources

The browser requests additional resources (e.g., images, CSS, JavaScript files) from the server.
* It applies CSS styles to format the page and runs JavaScript to make the page interactive (e.g., animations, form validations).
* Parallel Requests: Multiple resources are often requested in parallel, allowing the page to load faster.

### 10 - Rendering the Final Page
The browser combines all the assets (HTML, CSS, images, etc.) and renders the webpage on the screen.
It then continuously updates and reflows the page as JavaScript modifies the DOM (Document Object Model) or CSS.

### 11 - Connection Closure

Once the page is fully loaded, the browser closes the TCP connection.


## Sequence Diagram

{{< mermaid align="left" theme="neutral" >}}
sequenceDiagram
    actor User
    participant Browser
    participant DNS
    participant WebServer
    participant Database

    User ->> Browser: Enter URL
    Browser ->> DNS: Resolve domain
    DNS ->> Browser: Return IP address
    Browser ->> WebServer: Send HTTP request
    WebServer ->> Database: Query data (if needed)
    Database ->> WebServer: Return data
    WebServer ->> Browser: Return HTML response
    Browser ->> Browser: Parse HTML
    Browser ->> WebServer: Request CSS file
    WebServer ->> Browser: Return CSS
    Browser ->> WebServer: Request JavaScript file
    WebServer ->> Browser: Return JavaScript
    Browser ->> WebServer: Request Image files
    WebServer ->> Browser: Return Image files
    Browser ->> User: Display page
{{< /mermaid >}}
