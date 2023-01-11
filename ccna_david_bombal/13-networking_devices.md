# Networking Devices - Firewalls, IDS, IPS, WLC

- Many times now new routers have dedicated firewall functionalities but there's also dedicated firewall(hardware) like **Cisco ASA 5505**.
- You have option to have firewall devices infront of router or behind the router in network but having behind the router is good cause maybe your connection is not physical ethernet(router also supports ADSL, cables etc.) or your ISP manages the router etc.
- **DSL(digital subscriber line)** provides internet(data transfer through digital signal) over copper telephone cable(DSL cables)
- DSL have much higher frequency than voiceband.
- **SDSL(Symmetric DSL)** splits upstream and downstream frequencies evenly.
- **ADSL(Asymmetric DSL)** provide higher download speed(wider frequency range for download) than upload speed
- In order to access the Internet using DSL, you must connect to a DSL Internet service provider (ISP). The ISP will provide you with a DSL modem, which you can connect to either a router or a computer.
- Some DSL modems now have built-in wireless routers, which allows you to connect to your DSL modem via Wi-Fi. A DSL kit may also include a splitter and filters that you can connect to landline phones.
- Since DSL signals have a limited range, you must live within a specific distance of an ISP in order to be eligible for DSL Internet service.
- **WLC(Wireless Lan Controller)** used to manage _AP(access points)_.
- There's lightweight AP and Autonomous AP(requires manual configuring of AP). Both AP and WLC connects to switches and then APs are registered to these WLC.
- ASA firewalls are old, today we support `Next-generation Firewalls`. They support IDS and IPS etc.
- **IDS(Intrusion Detection System)** warns you about the intrusion in your system/network(just like a Dog).
- **IPS(Intrusion Prevention System)** detects and warns you about intrusion on network as well as blocks the attack.
- IDS sits beside the network traffic(they get copy of what passing through network), while IPS sits in-line with the network.
