
# Make your app available on the network
set :bind, '0.0.0.0'

# Run ifconfig en0 to show network address
# of your wireless
ifconfig en0

# In this case 10.0.10.145 is my address
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	ether 84:38:35:60:ad:70
	inet 10.0.10.145 netmask 0xffffff00 broadcast 10.0.10.255
	media: autoselect
	status: active
