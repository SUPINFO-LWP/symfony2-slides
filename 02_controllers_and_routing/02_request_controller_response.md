# HTTP

Symfony is an HTTP framework.

Request

    !bash
    GET /index.html HTTP/1.1
    Host: www.example.com

Response

    !bash
    HTTP/1.1 200 OK
    Content-Length: xxx
    Content-Type: text/html; charset=UTF-8

    <html>
        <body>
    ...

---

# Requests, Controller, Response Lifecycle

![schema_req-ctrl-lc](http://symfony.com/doc/current/_images/request-flow.png)

*[Source](http://symfony.com/doc/current/book/http_fundamentals.html#the-symfony-application-flow)*
