## Notes:

- In PDU(Protocol Data Unit), in Etherent(layer 2) frame, there's a type field which indicates how lower layer provide service to higher layer
- Talking about that type field, _0x0800_ represents IPv4 protocol.
- _0x0806_, indicates ARP.
- So, when a device recieves frame at layer 2, it needs to know which protocol to use or which protocol stack to use.
- In same way, to know which protocol used in layer 4, there's another field in layer 3(IP packet), like _0x06_ indicates TCP, while _0x11_ indicates UDP
- In same way, which protocol layer 7 will use is given in layer 4 field as `destination port`.
- A server/service will listen on well-known port number, but to initiate the communication to it, you will use _femoral_ or _random_ port numbers.
- From **IANA(Internet Assigned Numbers Authority)**:
	* System Ports(0-1023)
	* User Ports(1024-49151)
	* Dynamic/Private Ports(49152-65535)
- Dynamic port numbers are also known as `ephemeral port` numbers.
- An ephemeral port is a short-lived transport protocol port for IP communications.
- Ephemeral ports are allocated automatically from a predefined range by the IP stack software.
- An ephemeral port is typically used as the port assignment for the client-server communication to a particular port(usually a well-known port) on a server.
- Ranges for ports(not System) changes some times and are also not same for every OS.
- So, basically ephemeral range can be `1025-65535`.
- So, in communication(packet exchange), MAC, IP and Port(maybe add in few other details) get swapped around.
