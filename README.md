Fork of https://github.com/mookjin/WANem

# WANem for Ubuntu 20.04 on ZOTAC ZBOX CI329 Nano

## Preparations

* Install Ubuntu 20.04.3 LTS Server
	* https://releases.ubuntu.com/20.04/
	
* Install Software
	* sudo apt-get install apache2 php7.4 libapache2-mod-php7.4 bridge-utils net-tools

* Copy over all files to the root directory

* Restart network
	* sudo netplan apply

* Restart apache  
	* sudo systemctl restart apache2

* Start Apache on reboot (optional) 
	* sudo systemctl enable apache2
	
* Open Browser to http://xxx.xxx.xxx.xxx/WANem to configure your WANem.


# Previous README (https://github.com/worryboy/WANem):

These are the source files from WANem (http://wanem.sourceforge.net/). 

Update 2016.08.23 : WANem Beta 3.0.3. >> These files are corrected for the depedency on a debian 8 environment based on Beta 3.0.2.

----------------

WANem is a Wide Area Network Emulator, meant to provide a real experience of a Wide Area Network/Internet, during application development / testing over a LAN environment. Typically application developers develop applications on a LAN while the intended purpose for the same could be, clients accessing the same over the WAN or even the Internet. WANem thus allows the application development team to setup a transparent application gateway which can be used to simulate WAN characteristics like Network delay, Packet loss, Packet corruption, Disconnections, Packet re-ordering, Jitter, etc. WANem can be used to simulate Wide Area Network conditions for Data/Voice traffic and is released under the widely acceptable GPL v2 license. WANem thus provides emulation of Wide Area Network characteristics and thus allows data/voice applications to be tested in a realistic WAN environment before they are moved into production at an affordable cost. WANem is built on top of other FLOSS [Free Libre and OpenSource] components and like other intelligent FLOSS projects has chosen not to re-invent the wheel as much as possible.

From a functionality perspective WANem hooks into the Linux kernel towards provisioning the network emulation characteristics and extends the functionality with additional modules. Based on a re-mastered Knoppix cd WANem allows quick and easy setup in any development environment with an intuitive web interface for purposes of configuration.

WANEM is Open Source software licensed under the GNU General Public License. You are free to download WANem and use it in your own environments. We encourage you to write to us using the SourceForge forums. You may let us know your perspective on scope for improvement, or if you would like to contribute in anyway possible or of course just to drop us a note of encouragement.
