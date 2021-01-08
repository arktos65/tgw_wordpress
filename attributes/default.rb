# frozen_string_literal: true

#
# Cookbook Name:: tgw_wordpress
# Recipe:: default
#
# Copyright (C) 2020 TGW Consulting, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# MySQL database configuration
default['tgw_wordpress']['mysql']['service'] = 'default'
default['tgw_wordpress']['mysql']['bind_address'] = '0.0.0.0'
default['tgw_wordpress']['mysql']['port'] = '3306'
default['tgw_wordpress']['mysql']['data_dir'] = '/var/lib/mysql'
default['tgw_wordpress']['mysql']['user'] = 'wordpress'
default['tgw_wordpress']['mysql']['password'] = 'change me'
default['tgw_wordpress']['mysql']['database'] = 'wordpress_db'
default['tgw_wordpress']['mysql']['root_password'] = 'Chang4me3!'

# Wordpress controls
default['tgw_wordpress']['wp']['install'] = true
default['tgw_wordpress']['wp']['user'] = 'wordpress'
default['tgw_wordpress']['wp']['group'] = 'wordpress'
default['tgw_wordpress']['wp']['password'] = 'Ch4ngeM3!'
default['tgw_wordpress']['wp']['home_dir'] = "/home/#{node['tgw_wordpress']['wp']['user']}"
default['tgw_wordpress']['wp']['install_dir'] = "/home/#{node['tgw_wordpress']['wp']['user']}/html"
default['tgw_wordpress']['wp']['runtime_dir'] = "/home/#{node['tgw_wordpress']['wp']['user']}/html"
default['tgw_wordpress']['wp']['source'] = 'https://wordpress.org/latest.tar.gz'

# Nginx controls
default['tgw_wordpress']['nginx']['group'] = 'nginx'
default['tgw_wordpress']['nginx']['site'] = 'wordpress_site'
default['tgw_wordpress']['nginx']['port'] = '80'
default['tgw_wordpress']['nginx']['server_name'] = 'wordpress.local'
default['tgw_wordpress']['nginx']['enable_ssl'] = false
default['tgw_wordpress']['nginx']['log_dir'] = '/var/log/nginx'
default['tgw_wordpress']['nginx']['enable_site'] = true
