# debug_container

You can show the detail for container system info (hostname, cpu, memory etc..).  
It can be fetched using http communication.

# How to use
* docker run -p 80:4567 kakakikikeke/debug_container
* curl localhost | jq .

if you set an environment variable of "HOSTNAME_ONLY" is true, returnd only container's hostname.

* docker run -p 80:4567 -e HOSTNAME_ONLY=true kakakikikeke/debug_container

# Build
* git clone https://github.com/kakakikikeke/debug_container.git
* docker build -t debug_container .
* docker run -p 80:4567 debug_container
