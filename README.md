# debug-container

![usage_debug-container](https://raw.githubusercontent.com/kakakikikeke/debug-container/master/img/usage_debug_container.gif)

You can show the detail for container system info (hostname, cpu, memory etc..).  
It can be fetched using http communication.

# How to use
* docker run -p 80:4567 kakakikikeke/debug-container
* curl localhost | jq .

if you set an environment variable of "HOSTNAME_ONLY" is true, returnd only container's hostname.

* docker run -p 80:4567 -e HOSTNAME_ONLY=true kakakikikeke/debug-container

# Build
* git clone https://github.com/kakakikikeke/debug-container.git
* docker build -t kakakikikeke/debug-container .
* docker run -p 80:4567 kakakikikeke/debug-container

# Test
* bundle exec rspec spec/
