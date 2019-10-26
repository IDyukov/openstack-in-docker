{{PROVIDER_INTERFACE_NAME=eth1}}
[linux_bridge]
physical_interface_mappings = provider:{{PROVIDER_INTERFACE_NAME}}

[vxlan]
enable_vxlan = true
local_ip = {{HOST_IP_ADDRESS}}
l2_population = true

[securitygroup]
enable_security_group = true
firewall_driver = neutron.agent.linux.iptables_firewall.IptablesFirewallDriver
