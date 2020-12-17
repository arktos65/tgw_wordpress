#
# Cookbook:: tgw_wordpress
# Recipe:: nginx
#
# Copyright:: 2020, TGW Consulting, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'yum-centos::default'

Chef::Log.info('Installing Nginx web server.')
# Install Nginx server
nginx_install 'nginx' do
  source 'epel'
end

# Start the web server
nginx_service 'nginx' do
  action :enable
  delayed_action :start
end

nginx_config 'nginx' do
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end
