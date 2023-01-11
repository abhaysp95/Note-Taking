* enter privileged exec mode: **enable**
* enter global configuration mode (only after privileged exec mode): **configure terminal**
* set hostname (done in global conf mode): **hostname <host>**
* protect privileged exec mode (done in global configuration mode): **enable password <pass>**
* show running configuration: **show running-config**
* enable password encryption (done in global conf mode): **service password-encryption**
* show running config from global conf mode: **do show running-config**
* more secure encrypted enable password (uses md5): **enable secret <pass>**
* save running-config to startup-config: **write**, **write memory**, **copy running-config startup-config**
* show startup-config (run from privileged exec mode): **show startup-config**
