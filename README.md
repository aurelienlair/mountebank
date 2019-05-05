# Mountebank Docker Image

Installs the latest version of mountebank and exposes port 5959 ready for
configuration and testing.

Build docker image by running:
   
    docker build --rm -t mountebank:2.0.0 .
    
Running mountebank container is achieved by:

    docker run -p 5959:5959 --rm --name mountebank mountebank:2.0.0 -d
    
Then you can try if by running:

