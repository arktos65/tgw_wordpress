# frozen_string_literal: true

#
# Cookbook Name:: tgw_wordpress
# Recipe:: configure
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

Chef::Log.info('Installing firewalld service.')
yum_package 'firewalld' do
  action :install
end
bash 'enable_firewalld' do
  code <<-EOH
    systemctl enable firewalld && systemctl start firewalld
  EOH
end

# Add site to Nginx configuration
Chef::Log.info('Configuring Nginx web site settings.')
nginx_site node['tgw_wordpress']['nginx']['site'] do
  template 'default-site.erb'
  variables(
    'port': 80,
    'server_name': node['tgw_wordpress']['nginx']['server_name'],
    'default_root': node['tgw_wordpress']['wp']['runtime_dir'],
    'nginx_log_dir': node['tgw_wordpress']['nginx']['log_dir']
  )
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end

# Update firewall settings
Chef::Log.info('Opening firewall ports.')
firewalld_port "#{node['tgw_wordpress']['mysql']['port']}/tcp"
firewalld_port '80/tcp'
firewalld_port '443/tcp'

#TODO: Add SSL configuration support
