+++
title = "HTTP - HyperText Transfer Protocol"
type = ""
weight = 3
+++
 
 HyperText Transfer Protocol (HTTP) is an application-layer protocol used for transferring hypertext (web pages, images, videos, etc.) between clients (browsers) and servers. It is stateless, meaning each request is independent and does not retain session information. 
 **This protocol is built on top of TCP**

## Workflow

* **Client Request**: A web browser or app sends an HTTP request to a web server.
* **Server Processing**: The server processes the request, retrieves the requested resource, and generates a response.
* **Server Response**: The server sends an HTTP response, which includes the requested data and metadata (headers, status codes).
* **Rendering**: The client processes the response (e.g., a web browser renders an HTML page).

## HTTP Request Structure

A request consists of:
### Request Line

```
GET /index.html HTTP/1.1
```

* Method – Specifies the action (GET, POST, PUT, DELETE, etc.) - each one has a function according to the protocol and it's up to you to implement it properly.
* Resource Path – The requested file or endpoint (/index.html).
* Protocol Version – Defines the HTTP version (HTTP/1.1 or HTTP/2) - most websites still use HTTP/1.1.

This includes both [query parameters and path variables.](https://medium.com/@averydcs/understanding-path-variables-and-query-parameters-in-http-requests-232248b71a8)

Meaning it can end up looking like this:
```
GET /products?category=electronics&sort=price&limit=10 HTTP/1.1
```

### Headers

This  is essentially metadata of the request.

```
Host: www.example.com  
User-Agent: Mozilla/5.0  
Accept: text/html  
```
These are standard agreed headers that HTTP can send, but are not mandatory. This is what they mean:
* **Host** – Specifies the target server.  - We'll need to study DNS in order to understand this a bit better.
* **User-Agent** – Identifies the client (browser, bot, etc.).
* **Accept** – Indicates the content type the client can handle. - on browser you typicaly accept `html`, but WebServices communication typically happens in `json`.

To understand headers in detail, visit [this link](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers). This `Mozilla` website is a great reference for HTTP standards and deep diving into the protocol.

Because HTTP is based on TCP, TCP headers are also sent, but they should not to be confused with HTTP Headers which aren't present in TCP.

## Body - Optional

Not all HTTP request have body. In fact, depending on the method, some **cannot** have a body.

```json
{
  "username": "john_doe",
  "password": "securepassword"
}
```
This will contain data sent to the server (e.g., form submissions, JSON payloads).

## HTTP Response Structure

### Status Line

A server’s HTTP response consists of:

```
HTTP/1.1 200 OK
```
* **Protocol Version** – HTTP/1.1 or HTTP/2.*
* **Status Code** – Indicates success (2XX), error (4XX, 5XX), or redirection (3XX).
* **Status Message** – Human-readable response (e.g., OK, Not Found).

### Headers

```
Content-Type: text/html  
Content-Length: 3456  
```

These headers need to be present if there is a body, they specify the `type` of its content as well as its length in `bytes`.

### Body - Optional

Contains the requested content (HTML, JSON, an image, etc.).

```json
{
  "id": 3,
  "name": "Kalchatzi",
  "active": true
}
```

## HTTP Verbs/Actions

When you make an HTTP request you need to specify the action (verb). These are the ones available:

* GET – Retrieves data (read-only).
* POST – Sends data to create a resource (e.g., form submission).
* PUT – Updates or replaces a resource.
* PATCH – Partially updates a resource.
* DELETE – Removes a resource.
* HEAD – Like GET, but without a response body (for metadata).
* OPTIONS – Retrieves allowed HTTP methods for a resource.

## HTTP Status Codes
* 1xx (Informational): Processing, e.g., 100 Continue.
* 2xx (Success): Request completed, e.g., 200 OK, 201 Created.
* 3xx (Redirection): Resource moved, e.g., 301 Moved Permanently, 302 Found.
* 4xx (Client Errors): Bad requests, e.g., 400 Bad Request, 404 Not Found.
* 5xx (Server Errors): Server issues, e.g., 500 Internal Server Error, 503 Service Unavailable.

Take look a the entire [list of error codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
Check out what #418 for a fun curiosity!

## HTTP Versions
* HTTP/1.0 – First widely used version, lacks persistent connections.
* HTTP/1.1 – Introduced persistent connections, chunked transfers, better caching.
* HTTP/2 – Faster with multiplexing (multiple requests over one connection).
* HTTP/3 – Uses QUIC instead of TCP for lower latency and better security.

HTTP/1.1 is still the most prevalent in use at the moment.

### Limitations of HTTP

* Stateless – Each request is independent (can be solved with cookies, sessions, tokens).
* Latency – Multiple requests create overhead (improved with HTTP/2 and HTTP/3).
* Security Risks – Data can be intercepted if not encrypted (use HTTPS).

### HTTPS
A brief overview of is that HTTPS adds `S`ecurity to the protocol by encrypting the data sent. This prevents tempering and intercepting data.

## Interview questions
* **What's the difference between a GET and a POST?**
A GET only retrieves data and the request cannot contain a body. The server that receives this request cannot execute write operations as a result of it. In contrast, the POST is used to create resources and can contain a body.
* **What's the difference between a PUT and a POST?**
PUT is idempotent - it either updates or creates the record, meaning the same request will generate the same response. The POST is used to create a resource. If you send the same POST request twice, the second one should fail because it clashes with the first one.
* **What's the difference between 4XX and 5XX error codes?** 4XX are typically client-side errors, while 5XX are server-side errors. For example, `404 Not found` - the user requested a nonexistent URL. `503 Unavailable` - something is wrong on the server side that makes it unreachable.