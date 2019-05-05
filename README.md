# Mountebank Docker Image

[Mountebank](http://www.mbtest.org/) is a nice tool if you want to mock APIs.
With this repo it's pretty easy to install the latest version of mountebank. 
It exposes port 5959 ready for configuration and to test what you need.

### Build and run the container

Build docker image by running:
   
    docker build --rm -t mountebank:2.0.0 .
    
Running mountebank container is achieved by:

    docker run -p 5959:5959 --rm --name mountebank mountebank:2.0.0 -d
    
Then you can try if by running:

### Testing

Now you are ready to try the set-up
```
aurelien@linux:~$ /usr/bin/curl -v "http://localhost:5959/ping" \
-H "Accept: application/json"

> GET /ping HTTP/1.1
> User-Agent: /usr/bin/curl/7.55.1
> Host: localhost:5959
> Accept: application/json
>
< HTTP/1.1 200 OK
< Date: Sun, 05 May 2019 15:20:13 GMT
< Cache-Control: no-cache, private
< X-RateLimit-Limit: 60
< X-RateLimit-Remaining: 59
< Content-Length: 6
< Connection: close
< Content-Type: application/json
<
{
    "value":"pong"
}
```