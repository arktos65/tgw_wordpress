#
# Cookbook:: tgw_wordpress
# Recipe:: database
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
include_recipe 'yum-mysql-community::mysql57'

mysql_service node['tgw_wordpress']['mysql']['service'] do
  version '5.7'
  bind_address node['tgw_wordpress']['mysql']['bind_address']
  port node['tgw_wordpress']['mysql']['port']
  data_dir node['tgw_wordpress']['mysql']['data_dir']
  initial_root_password node['tgw_wordpress']['mysql']['root_password']
  action [:create, :start]
end