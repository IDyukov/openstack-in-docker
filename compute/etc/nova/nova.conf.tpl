[DEFAULT]
log_dir = /var/log/nova
lock_path = /var/lock/nova
state_path = /var/lib/nova
transport_url = rabbit://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@controller
my_ip = {{HOST_IP_ADDRESS}}
use_neutron = true
firewall_driver = nova.virt.firewall.NoopFirewallDriver

[api]
auth_strategy = keystone

[keystone_authtoken]
auth_url = http://controller:5000/v3
memcached_servers = controller:11211
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = {{NOVA_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[vnc]
enabled = true
server_listen = 0.0.0.0
server_proxyclient_address = $my_ip
novncproxy_base_url = http://controller:6080/vnc_auto.html

[glance]
api_servers = http://controller:9292

[oslo_concurrency]
lock_path = /var/lib/nova/tmp

[placement]
region_name = {{DEFAULT_REGION}}
project_domain_name = Default
project_name = service
auth_type = password
user_domain_name = Default
auth_url = http://controller:5000/v3
username = {{PLACEMENT_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[neutron]
url = http://controller:9696
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = {{DEFAULT_REGION}}
project_name = service
username = {{NEUTRON_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}
