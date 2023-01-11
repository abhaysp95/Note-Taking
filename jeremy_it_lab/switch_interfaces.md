# Switch Interface

```
SW1# show interface status

Port      Name               Status       Vlan       Duplex  Speed Type
Fa0/1                        connected    1          auto    auto  10/100BaseTX
Fa0/2                        connected    1          auto    auto  10/100BaseTX
Fa0/3                        notconnect   1          auto    auto  10/100BaseTX
Fa0/4                        notconnect   1          auto    auto  10/100BaseTX
Fa0/5                        notconnect   1          auto    auto  10/100BaseTX
Fa0/6                        notconnect   1          auto    auto  10/100BaseTX
Fa0/7                        notconnect   1          auto    auto  10/100BaseTX
Fa0/8                        notconnect   1          auto    auto  10/100BaseTX
Fa0/9                        notconnect   1          auto    auto  10/100BaseTX
Fa0/10                       notconnect   1          auto    auto  10/100BaseTX
Fa0/11                       notconnect   1          auto    auto  10/100BaseTX
Fa0/12                       notconnect   1          auto    auto  10/100BaseTX
Fa0/13                       notconnect   1          auto    auto  10/100BaseTX
Fa0/14                       notconnect   1          auto    auto  10/100BaseTX
Fa0/15                       notconnect   1          auto    auto  10/100BaseTX
Fa0/16                       notconnect   1          auto    auto  10/100BaseTX
Fa0/17                       notconnect   1          auto    auto  10/100BaseTX
Fa0/18                       notconnect   1          auto    auto  10/100BaseTX
Fa0/19                       notconnect   1          auto    auto  10/100BaseTX
Fa0/20                       notconnect   1          auto    auto  10/100BaseTX
Fa0/21                       notconnect   1          auto    auto  10/100BaseTX
Fa0/22                       notconnect   1          auto    auto  10/100BaseTX
Fa0/23                       notconnect   1          auto    auto  10/100BaseTX
Fa0/24                       notconnect   1          auto    auto  10/100BaseTX
Gig0/1                       connected    1          auto    auto  10/100BaseTX
Gig0/2                       connected    1          full    1000  10/100BaseTX
```

* `Trunk` here shows that interface of _SW1_ is connected to other switch. (didn't show in packettracer)
* `auto` stands for auto-negotiation with neighbouring device for both speed and duplex.
* Status will changed to `disabled` if interfaces are _shutdown_ manually.

## configuring interface speed and duplex

```
SW1(config)# speed 100
SW1(config)# duplex full
```


## configuring multiple interfaces

```
SW1(config)# interface range f0/5-12
SW1(config-if-range)# description ## not in use ##
SW1(config-if-range)# shutdown
```

Interface range need not to be consecutive

```
SW1(config)# interface range f0/5-6, f0/9-12
SW1(config)# no shut
```

## Duplex

### Half Duplex

Data can't be sent both ways at same time from a device. If a device is recieving a frame, it must wait before sending a frame. Hub uses half duplex.

Hub basically floods any frames it recieves just like switch does with _broadcast_ frame or with _unknown unicast_ frame. If two devices send frame at same time, Hub will simply flood all the recieved frame from its interfaces which will result in collision. All devices attached to Hub are part of the collision domain. To deal with situations like this ethernet devices use mechanism called `CSMA/CD`.

### Full Duplex

Data can be sent both ways at the same time. It doesn't have to wait. Device attached to switch can operate in full-duplex.


## Collision

### CSMA/CD

* Stands for **Carrier Sense Multiple Access with Collision Detection**.
* Each device listens to collision domain, whether other device is not sending, before 'sending' frames.
* In case if collision happens, the device sends jamming signal informing other device that collision happened.
* Each device will wait random period of time before sending another frame.


Switches are more sophesticated than Hub and thus every interface with connection is a separate collision domain in switch.


## Speed/Duplex Auto-negotiation

This is for both switch and routers

* Interfaces that can run at different speeds (10/100 or 10/100/1000) have default setting of _speed_auto_ or _duplex_auto_.
* Interfaces 'advertise' their capabilities to neighbouring device, and they negotiate the best speed and duplex setting they are capable of.


What if auto-negotiation is turned off on device connected to switch ?

* **Speed:** Switch will try to sense the speed the other device is operating at. If it fails, the switch will use minimum supported speed (e.g., 10 Mbps on 10/100/1000 interface)
* **Duplex:** The switch will use half-duplex for 10 and 100 Mbps and full-duplex for 1000 Mbps or greater speed. (Duplex can't be sensed for the device which have auto-negotiation disabled, unlike speed).

Duplex mismatch can cause collision to occur. E.g., device with 100 Mbps speed using full-duplex and auto-negotiation turned off but switch will use half-duplex for 100 Mpbs and it'll cause collision.


## Interface errors

These are the information shown for example in command like `show interfaces <int>`

* **Runts:** Frames that are smaller than minimum frame size (64 bytes)
* **Giants:** Frames that are larger than maximum frame size (1518 bytes)
* **CRC:** Frames that failed the CRC check (in the ethernet FCS trailer)
* **Frames:** Frames that have incorrect format (due to error)
* **Input Errors:** Total of various counters (such as the above four)
* **Output Errors:** Frames that switch tried to send, but failed due to an error
