WANem running on Ubuntu 20.04

# WANem for Ubuntu 20.04

## Preparations
* Install Software
	* apt-get install apache2 php7.4 libapache2-mod-php7.4


* Adjust system configuration
	* /etc/sudoers -> Add lines to your file
	* /etc/apache2 -> Adjust Default Webshare accordingly.
	* /etc/php/7.4/[apache2|cli]/php.ini -> Verify all parameters are set as in provided files. 
	* copy /root/* to your /root folder
	* copy /var/www/* to your /var/www

* Restart apache  
	* systemctl restart apache2
	
* Open Browser to http://localhost/WANem to configure your WANem.

## Optional - bridge configuration

When using a bridge configuration, make sure when setting the latency / Bandwidth to apply it to all physical interfaces from the bridge!

As example, you want to have 30ms latency with 10Mbit Bandwidth. In this case you need to set to each interface 15ms (30ms / 2) and 10Mbit.
With this configuration the sending and receiving packets, between two hosts, are applied 15ms latency in each direction, when passing the interface.
The 10Mbit on alll Interfaces is needed to enforce the 10Mbit bandwidth in all possible directions.

* Install Software
	* apt-get install bridge-utils (only needed if bridge mode is wanted)

	* Create a netplan file: /etc/netplan/02-bridge.yaml, with the following content:
```
vi /etc/netplan/02-switch.yaml
Inhalt:

network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      dhcp6: no
    eth1:
      dhcp4: no
      dhcp6: no
 
  bridges:
    br0:
      interfaces: [eth0, eth1]
      dhcp4: no
      stp: false
      addresses: [192.168.1.250/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [192.168.1.1]
      parameters:
        stp: false
        forward-delay: 0
```
	* Replace the interface names with the interfaces on your pc.
	* Edit the IPs as needed.
* Run "sudo netplan apply"
* Reboot PC

## Optional - autologon and open browser to WANem
* Upper right -> User -> Account settings:
	* Unlock button on window bar
	* set automatic logon
* windows button -> open "startup applications"
	* add:
```
Name: Firefox
Command: /usr/bin/firefox
Comment: "Start Firefox with WANem"
```
* Open Firefox -> Edit -> Preferences
	* Home
	* Custom URL: http://localhost/WANem


## Optional - autostart PC with 15ms latency and 50mbit Bandwidth per Interface

When enabling this script, it sets the latency of 15ms and 50Mbit Bandwidth to all Interfaces, that are connected on bootup.

* sudo 
* crontab -e
* add the line:
```
	@reboot sudo /root/default_tc_settings.sh
```


# Previous README:

These are the source files from WANem (http://wanem.sourceforge.net/). 

Update 2016.08.23 : WANem Beta 3.0.3. >> These files are corrected for the depedency on a debian 8 environment based on Beta 3.0.2.

----------------

WANem is a Wide Area Network Emulator, meant to provide a real experience of a Wide Area Network/Internet, during application development / testing over a LAN environment. Typically application developers develop applications on a LAN while the intended purpose for the same could be, clients accessing the same over the WAN or even the Internet. WANem thus allows the application development team to setup a transparent application gateway which can be used to simulate WAN characteristics like Network delay, Packet loss, Packet corruption, Disconnections, Packet re-ordering, Jitter, etc. WANem can be used to simulate Wide Area Network conditions for Data/Voice traffic and is released under the widely acceptable GPL v2 license. WANem thus provides emulation of Wide Area Network characteristics and thus allows data/voice applications to be tested in a realistic WAN environment before they are moved into production at an affordable cost. WANem is built on top of other FLOSS [Free Libre and OpenSource] components and like other intelligent FLOSS projects has chosen not to re-invent the wheel as much as possible.

From a functionality perspective WANem hooks into the Linux kernel towards provisioning the network emulation characteristics and extends the functionality with additional modules. Based on a re-mastered Knoppix cd WANem allows quick and easy setup in any development environment with an intuitive web interface for purposes of configuration.

WANEM is Open Source software licensed under the GNU General Public License. You are free to download WANem and use it in your own environments. We encourage you to write to us using the SourceForge forums. You may let us know your perspective on scope for improvement, or if you would like to contribute in anyway possible or of course just to drop us a note of encouragement.
