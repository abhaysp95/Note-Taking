# Introduction to Networking


### Protocol
A defined set of standards that computers must follow in order to communicate properly.

### Computer Networking
The name we've given to the full scope of how computers communicate with each other.


## The TCP/IP Five-Layer Network Model

| **#** | **Layer Name** | **Protocol**      | **Protocol Data Unit** | **Addressing** |
| :---: | :---:          | :---:             | :---:                  | :---:          |
| 5     | Application    | HTTP, SMTP etc.   | Messages               | n/a            |
| 4     | Transport      | TCP/UDP           | Segment                | Port #'s       |
| 3     | Network        | IP                | Datagram               | IP address     |
| 2     | Data Link      | Ethernet, Wi-Fi   | Frames                 | MAC Address    |
| 1     | Physical       | 10 Base T, 802.11 | Bits                   | n/a            |

### Physical Layer
It represents the physical devices that interconnect computers.

### Data Link Layer
Also known as the `Network Interface` or the `Network Access` layer.
Responsible for defining a common way of interpreting these signals so network devices can communicate. The **Ethernet** standards also define a protocol responsible for getting data to nodes on the same network or link.

### Network Layer
Also known as `Internet Layer`, allows different networks to communicate with each other through devices known as routers. A collection of networks connected together through routers is know as **Internetwork**, the most famous of these being the **Internet**.

**IP** is the heart of the Internet and also to most of the smaller networks around the globe.

### Transport Layer
Sorts out which client and server programs are supposed to get that data, what has been delievered by _network layer_. **TCP(Transport Communication Protocol)** is the most known protocol here.

Another transport layer protocol is **UDP** which also uses IP. **User Datagram Protocol**. **TCP** provides mechanisms to ensure that data is reliably delievered while **UDP** doesn't.

### Application Layer
Application layer is the contents of package itself.

To understand more, take the example of _Delievery Truck_.


## The Basics of Networking Devices

### Cables
Connect different devices to each other, allowing data to be transmitted over them.

Mainly, two categories:
* **Copper**
--------
Made up of multiple pairs of Cu wires inside plastic insulators.
Sending devices transmits binary by changing voltages and reciveing is able to interpret in binary
The most common forms of copper twisted-pair cables used in Networking are **Cat5**, **Cat5e** and **Cat6** cables.

Cat5e cables have mostly replaced Cat5 cables because of **CrossTalks**.
**CrossTalks** means, when an electrical pulse of one wire is introduced accidently to another wire. So, reciveing end isn't able to understand the data, causing Network Error.

Cat6 can transfer data more faster and more reliably than Cat5e but due to there internal arrangement, they have shorter maximum distance when used at higher speed.

* **Fiber**
-----------
Contain individual optical fibers, which are tiny tubes of glass about the width of human hair.

Fiber cable uses pulses of light to represent 1's and 0's for underlying data. Also, used in places where there is a lot of electromagnetic interference.

Fiber cables transfer data more faster and without data loss than copper ones and can be used for very long ranges but are expensive and fragile.


### Hubs and Switches

These are the primary devices to connect on a single network, usually referred as LAN.

* **Hub**
---------
A physical layer device that allows for connections from many computers at once.

A **Collision Domain** is a network segment where only one device can communicate at a time. If multiple systems try sending data at the same time, the electrical pulses sent across the cable can interfere with each other.

So, the _hubs_ are rarely used today.

* **Network Switch**
--------------------
Orignally known as _Switching Hub_.

Switch is similar to hub, with the difference that _hub_ is _layer 1_ device, while _switch_ is _layer 2_ device.

So, unlike hub, where every connected node(computer) have to decide if the data is for it or to ignore, switch can inspect the consent of the ethernet protocol around the network and determine which system the data is intended for.

This almost eleminates the size of **Collision Domain**. This will lead to fewer _re-transmissions_ and higher _throughput_.

### Routers

A router knows how to send data between independent networks.

A device that knows how to forward data between independent networks. It's a _layer 3_ device and determines _ip data_ to where to send these.

Routers stores internal tables containing information of how to route traffic between lots of computer networks. Routers for home networks or small offices generally don't have very detailed **routing tables**.

Purpose of routers is to take traffic and forward it to ISP. These ISP's core router form the backbone of the Internet.

Routers share data with each other via **BGP(Border Gateway Protocol)**

Routers are the global guides for the internet to get the information to the right places.

### Servers and Clients

Provider of data is _server_ while thing requesting that _data_ is client.

Individual computer programs running on same node could be server and client to each other. Almost all nodes are both(server and clients) at some point of time.

## The Physical Layer

### Moving the bits across wire

Physical layer is much more approachable. 1 and 0 are sent across those network cables through a process known as modulation.
**Modulation** is a way of varying the voltage of this charge across the cable.
When use for computer networks this kind of modulation is known as **Line coding**.

### Twisted Pair Cabling and Duplexing

There twisted nature help protect against twisted pair nature and crostalk of neighbour. In all modern technologies, these cables allows for **duplex** communication, which is a concept that information can flow in both directions across the cable, while **simplex** communication is unidirectional like _server to client_. A phone call is known as Duplex communication. So, 1 or two pairs can be used for transimission and others are reciever. If there is a problem and only thing is happening then it's _half duplex_.

### Network Ports and Patch Panels

Twisted Pair network cables are terminated with a plug which takes the individual internal wires and exposes them. Most common is **RJ45 Plug** connects with **RJ45 Network Port**.

Network Ports are generally directly attached to the devices that make up a computer network. Network devices have many network ports, while end devices have only few.

In end devices, there are mainly two leds, _'link light'_ and _'network light'_ which tells connection and transmission status respectively. Switches can have more.

A patch panel is a device that contain many network ports and doesn't knows any network devices.

### The Data Link Layer
Most common protocol in this layer is _Ethernet_. Ethernet introduced in 1980 and saw its first fully polished standardization in 1983. Changes in bandwidth from that date. At that switches/hub weren't invented. Devices shared single collision domain. Collision domain is a network segment where only one device can speak at a time. A data was sent to all the nodes connected to that collision domain. If two nodes send data at a time this would result in literal collision. _Ethernet_ solved this problem by using technique **Carrier Sends Multiple Access With Collision Detection** or known as **CSMA/CD**. It is used to determine when the communications channels are clear and when a device is free to transmit data.

We needed a way to determine to which node the transmission was actually meant for. This is where **MAC(Media Access Control) Adrress** comes into play. It's a globally unique identifier attached to an individual network interface. It's a 48-bit number normallly represented by six groupings of two _hexadecimal_ numbers. Another to represent MAC address is an _Octet_.

The first three octets of mac address are **OUI(Organizationally Unique Indentifier)**. These are assigned by individual hardware manufactures by _IEEE(Institue of Electrical & Electronics Enginees)_. Last three octets are Vendor assigned and can be assigned as any way manufactorers can like but it should be unique.

**Ethernet** uses **MAC** addresses to ensure that the data it has both an address for the machine that sent the transimission and another address for the machine to which transmission was intended for.

### Unicast, Multicast and Broadcast

A **unicast** transmission is always meant for just one receiving address. At ethernet level, this done by looking at a special bit in the destination mac address. If the least significant bit in the first octect of a destination address is set to _zero_, it means that ethernet frame is intended for **only the destination address**. It means that it would be sent to all devices on collision domain but only recieved by the intended one.

If the least significant bit in the first octet of a desitnation address is set to one, it means you're dealing with a **multicast frame**. In this transmission will be sent to each node, difference is it'll be accepted or discarded by each device depending on the criteria aside from their own mac address. Network Interfaces can accept list of Multicast address for this.

**Ethernet Broadcast** is used to send to every device on LAN. Accomplished by using special destination address known as **Broadcast Address**. This address is all F, _FF:FF:FF:FF:FF:FF_. By this devices can learn more about is other.

### Disecting the Ethernet Frame

* **Data Packet:** An all-encompassing term that represents any single set of binary data being sent across a network link.

Data packets at ethernet level are known as _Ethernet frames_.

* **Ethernet Frames:** A highly structured collection of information presented in a specific order.

* **Parts of Ethernet Frames:**
	- **Preamble:** 8 bytes(64 bits) long and can be split in two sections. First 7 bytes are series of alternating 1 and 0. These act partially as a buffer between frames and can also be used by network interfaces to syncronize the internal clock they use to regulate the speed at which they send data. Last byte is known as **SFD(Start Frame Delimiter)** which signals to a recieving device that the preamble is over and the actual frame contents will now flow.
	- **Destination MAC address**: hardware address of intended recipient.
	- **Source MAC address:** where the frame originated from.
	- **EtherType Field**: 16 bits long and used to describe the protocol of the contents of the frame.
	- **VLAN:** A technique that lets you have multiple logical LANs operating on the same physical equipment. VLAN's are usually used to segregate different forms of traffic.
	- **Data Payload:** Payload in networking terms, is the actual data being transported, which is everything that isn't header.(46 to 1500 bytes long.)
	- **FCS(Frame Check Sequence):** A 4-byte (or 32-bit) number that represents a checksum value for the entire frame. This checksum value is calculated by performing what's known as a _cyclical redundancy check_ against the frame. So, performes CRC and attaches checksum as FCS.

	> You can also find VLAN header in place of EtherType. It indicates that the frame itself is what's called a VLAN frame. If a VLAN header is present EtherType field follows it.

	> CRC(Cyclical Redundancy Check) is an important concept for data integrity and is used all over computing, not just network transmissions.

Now, data is sent trough a link and reciever performs CRC against that data and if it isn't matched to checksum in FCS, data is thrown out.

This could happen due to some error in transmission, this is now on higher level to re-transmit data. Ethernet itself only reports on data-integrity and not performs data recovery.
