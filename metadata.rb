name 'tgw_wordpress'
maintainer 'Sean M. Sullivan'
maintainer_email 'sean@tgwconsulting.co'
license 'Apache-2.0'
description 'Install and configure standalone Wordpress system.'
long_description 'Installs and configures Nginx, MySQL, PHP, and Wordpress on a standalone system.'
version '0.2.1'
chef_version '>= 13' if respond_to?(:chef_version)

['centos', 'fedora', 'redhat', 'scientific'].each do |os|
  supports os
end

issues_url 'https://github.com/arktos65/tgw_wordpress/issues'
source_url 'https://github.com/arktos65/tgw_wordpress'

depends 'tgw-server-base'
depends 'yum-centos'
depends 'yum-mysql-community'
depends 'firewalld'
depends 'nginx'
depends 'mysql'
