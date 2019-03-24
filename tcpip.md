# TCP/IP life cycle

`FRAME:Binary[IP:ip[TCP:port[GET www.google.com]]]`
Application -> client TCP(SYN) -> IP -> link -> SERVER -> server TCP (SYN-ACK) ->  client  
When requesting a url on browser what happend:  
  -  Broswer extract scehma/protocol from the url
  -  Resolve URL to IP address
     -  Send UDP to DNS server to find out the IP
     -  If can't find address then relay it to another DNS
  - Pass it to transport layer (here is TCP)
    - Add header with ports of sender and receiver host
    - Chunck and create message with `SYN` flag messages. Now we have segment.
  - Pass to network layer (here is IP)
    - Add IP to header. Now we have datagram
  - Pass it to network access layer
    - `Frame` the message with header and footer. In header we have MAC of sender and MAC of next receiver (probably the next router we already know)
    - How get MAC address? by broadcasting ARP message: "Give me your MAC if your IP is receiver IP"
  - Convert it to binary
  - Send the packet to next node. 
    - If MAC and IP matches for this node, then it is the host.
    - If not, it will remove the MAC from header and add his MAC as sender and next router MAC as receiver
  - Receiver will 
