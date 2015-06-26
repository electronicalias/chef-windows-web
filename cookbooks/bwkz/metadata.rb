name             'bwkz'
maintainer       'Phil Smith'
maintainer_email 'philip.smith@nordcloud.com'
license          'Apache 2.0'

description      'Installs IIS'
long_description 'Install and configure Brandworkz Server'
version          '1.0'

# Cookbook dependencies (IIS and Windows)
depends          'iis'
depends          'windows'

# Supported platforms
supports 'windows'