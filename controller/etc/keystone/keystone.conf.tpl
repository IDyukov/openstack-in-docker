[database]
connection = mysql+pymysql://{{OS_MASTER_USERNAME}}:{{OS_MASTER_PASSWORD}}@{{DB_HOST}}/{{KEYSTONE_IDENTITY}}

[token]
provider = fernet
