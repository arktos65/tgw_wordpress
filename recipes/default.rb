#
# Cookbook:: tgw_wordpress
# Recipe:: default
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

# Install required server components and languages
node.override['tgw-server-base']['php']['install'] = true
include_recipe 'tgw-server-base::default'
include_recipe 'tgw_wordpress::database'
include_recipe 'tgw_wordpress::nginx'
include_recipe 'tgw_wordpress::wordpress' if node['tgw_wordpress']['wp']['install']
include_recipe 'tgw_wordpress::configure'
