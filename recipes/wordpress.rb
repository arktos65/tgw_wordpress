# frozen_string_literal: true

#
# Cookbook Name:: tgw_wordpress
# Recipe:: wordpress
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

# Create hosting user
Chef::Log.info('Setting up web hosting account user.')
group node['tgw_wordpress']['wp']['group'] do
  comment 'Wordpress hosting group'
  action :create
end
user node['tgw_wordpress']['wp']['user'] do
  comment 'Wordpress hosting user'
  gid node['tgw_wordpress']['nginx']['group']
  home node['tgw_wordpress']['wp']['home_dir']
  manage_home true
  shell '/bin/bash'
  password node['tgw_wordpress']['wp']['password']
  action :create
end
# Create Wordpress install directory
directory node['tgw_wordpress']['wp']['home_dir'] do
  owner node['tgw_wordpress']['wp']['user']
  group node['tgw_wordpress']['nginx']['group']
  mode '0750'
  action :create
end
directory node['tgw_wordpress']['wp']['install_dir'] do
  owner node['tgw_wordpress']['wp']['user']
  group node['tgw_wordpress']['nginx']['group']
  mode '0755'
  action :create
end

# Download latest build of Wordpress
Chef::Log.info('Download and extract Wordpress package.')
remote_file "#{node['tgw_wordpress']['wp']['install_dir']}/wordpress.tgz" do
  source node['tgw_wordpress']['wp']['source']
  owner node['tgw_wordpress']['wp']['user']
  group node['tgw_wordpress']['nginx']['group']
  mode '0755'
  action :create
end
execute 'extract_wordpress' do
  command 'tar --strip-components=1 -zxvf wordpress.tgz'
  cwd node['tgw_wordpress']['wp']['install_dir']
  user node['tgw_wordpress']['wp']['user']
  group node['tgw_wordpress']['nginx']['group']
end
execute 'update_runtime_permissions' do
  command 'chmod 755 -R *'
  cwd node['tgw_wordpress']['wp']['install_dir']
end

