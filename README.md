WANem running on Ubuntu 18.04.2

# WANem for Ubuntu

## Preparations
* Install Software
	* apt-get install apache2 php7.2 libapache2-mod-php7.2


* Adjust system configuration
	* /etc/sudoers -> Add lines to your file
	* /etc/apache2 -> Adjust Default Webshare accordingly.
	* /etc/php/7.2/[apache2|cli]/php.ini -> Verify all parameters are set as in provided files. 
	* copy /root/* to your /root folder
	* copy /var/www/* to your /var/www

* Restart apache  
	* systemctl restart apache2
	
* Open Browser to http://localhost/WANem to configure your WANem.

## Optional - bridge configuration

* Install Software
	* apt-get install bridge-utils (only needed if bridge mode is wanted)
* Get all NIC Names( ip address show)
* Remove all NIC definitions from /etc/network/interfaces
* Add to /etc/network/interfaces:

auto br0
iface br0 inet dhcp
bridge_ports eth0 eth1 ethn	 
* Reboot PC

## Optional - autologon and open browser to WANem
* Upper right -> User -> Account settings:
	* Unlock button on window bar
	* set automatic logon
* windows button -> open "startup applications"
	* add:

Name: Firefox
Command: /usr/bin/firefox
Comment: "Start Firefox with WANem"
* Open Firefox -> Edit -> Preferences
	* Home
	* Custom URL: http://localhost/WANem


## Optional - autostart PC with 15ms latency and 50mbit Bandwidth per Interface
* sudo 
* crontab -e
* add the line:

	@reboot sudo /root/default_tc_settings.sh



# Previous README:

These are the source files from WANem (http://wanem.sourceforge.net/). 

Update 2016.08.23 : WANem Beta 3.0.3. >> These files are corrected for the depedency on a debian 8 environment based on Beta 3.0.2.

----------------

WANem is a Wide Area Network Emulator, meant to provide a real experience of a Wide Area Network/Internet, during application development / testing over a LAN environment. Typically application developers develop applications on a LAN while the intended purpose for the same could be, clients accessing the same over the WAN or even the Internet. WANem thus allows the application development team to setup a transparent application gateway which can be used to simulate WAN characteristics like Network delay, Packet loss, Packet corruption, Disconnections, Packet re-ordering, Jitter, etc. WANem can be used to simulate Wide Area Network conditions for Data/Voice traffic and is released under the widely acceptable GPL v2 license. WANem thus provides emulation of Wide Area Network characteristics and thus allows data/voice applications to be tested in a realistic WAN environment before they are moved into production at an affordable cost. WANem is built on top of other FLOSS [Free Libre and OpenSource] components and like other intelligent FLOSS projects has chosen not to re-invent the wheel as much as possible.

From a functionality perspective WANem hooks into the Linux kernel towards provisioning the network emulation characteristics and extends the functionality with additional modules. Based on a re-mastered Knoppix cd WANem allows quick and easy setup in any development environment with an intuitive web interface for purposes of configuration.

WANEM is Open Source software licensed under the GNU General Public License. You are free to download WANem and use it in your own environments. We encourage you to write to us using the SourceForge forums. You may let us know your perspective on scope for improvement, or if you would like to contribute in anyway possible or of course just to drop us a note of encouragement.
