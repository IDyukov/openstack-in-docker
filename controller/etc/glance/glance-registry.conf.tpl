[DEFAULT]

[database]
connection = mysql+pymysql://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@{{DB_HOST}}/{{GLANCE_IDENTITY}}

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = {{GLANCE_IDENTITY}}
password = {{OS_MASTER_PASSWORD}}

[paste_deploy]
flavor = keystone
