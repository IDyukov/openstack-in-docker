[DEFAULT]
core_plugin = ml2
transport_url = rabbit://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@controller
auth_strategy = keystone

[agent]
root_helper = "sudo /usr/bin/neutron-rootwrap /etc/neutron/rootwrap.conf"

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = {{NEUTRON_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[oslo_concurrency]
lock_path = /var/lib/neutron/tmp
