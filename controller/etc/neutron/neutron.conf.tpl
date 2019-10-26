[DEFAULT]
core_plugin = ml2
service_plugins = router
allow_overlapping_ips = true
transport_url = rabbit://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@controller
auth_strategy = keystone
notify_nova_on_port_status_changes = true
notify_nova_on_port_data_changes = true

[agent]
root_helper = "sudo /usr/bin/neutron-rootwrap /etc/neutron/rootwrap.conf"

[database]
connection = mysql+pymysql://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@{{DB_HOST}}/{{NEUTRON_IDENTITY}}

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = {{NEUTRON_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[nova]
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = RegionOne
project_name = service
username = {{NOVA_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[oslo_concurrency]
lock_path = /var/lib/neutron/tmp
