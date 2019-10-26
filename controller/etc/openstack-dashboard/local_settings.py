# -*- coding: utf-8 -*-

import os

from django.utils.translation import ugettext_lazy as _

from horizon.utils import secret_key

from openstack_dashboard.settings import HORIZON_CONFIG

DEBUG = False

COMPRESS_ENABLED = not DEBUG
COMPRESS_OFFLINE = not DEBUG

WEBROOT = "/horizon"

ALLOWED_HOSTS = [ "*" ]

SESSION_ENGINE = "django.contrib.sessions.backends.cache"

CACHES = {
    "default": {
         "BACKEND": "django.core.cache.backends.memcached.MemcachedCache",
         "LOCATION": "controller:11211",
    }
}

OPENSTACK_HOST = "controller"

OPENSTACK_KEYSTONE_URL = "http://%s:5000/v3" % OPENSTACK_HOST

OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True

OPENSTACK_API_VERSIONS = {
    "identity": 3,
    "image": 2,
    "volume": 3,
}

OPENSTACK_KEYSTONE_DOMAIN_DROPDOWN = True

OPENSTACK_KEYSTONE_DOMAIN_CHOICES = (
 ("Default", "Default"),
)

OPENSTACK_KEYSTONE_DEFAULT_DOMAIN = "Default"

OPENSTACK_KEYSTONE_DEFAULT_ROLE = "member"

OPENSTACK_NEUTRON_NETWORK = {
    "enable_router": True,
    "enable_quotas": False,
    "enable_ipv6": False,
    "enable_distributed_router": False,
    "enable_ha_router": False,
    "enable_lb": False,
    "enable_firewall": False,
    "enable_vpn": False,
    "enable_fip_topology_check": False,
}

#TIME_ZONE = "TIME_ZONE"

REST_API_REQUIRED_SETTINGS = [
    "OPENSTACK_HYPERVISOR_FEATURES",
    "LAUNCH_INSTANCE_DEFAULTS",
    "OPENSTACK_IMAGE_FORMATS"
]

IMAGE_CUSTOM_PROPERTY_TITLES = {
    "architecture": _("Architecture"),
    "kernel_id": _("Kernel ID"),
    "ramdisk_id": _("Ramdisk ID"),
    "image_state": _("Euca2ools state"),
    "project_id": _("Project ID"),
    "image_type": _("Image Type"),
}

IMAGES_ALLOW_LOCATION = True
HORIZON_IMAGES_UPLOAD_MODE = "legacy"

AVAILABLE_THEMES = [
   ("default", "Default", "themes/default"),
   # ("material", "Material", "themes/material"),
   # ("example", "Example", "themes/example"),
]
