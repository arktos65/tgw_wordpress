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
default['tgw_wordpress']['mysql']['data_dir'] = '/data'
default['tgw_wordpress']['mysql']['user'] = 'wordpress'
default['tgw_wordpress']['mysql']['password'] = 'change me'
default['tgw_wordpress']['mysql']['database'] = 'wordpress_db'
default['tgw_wordpress']['mysql']['root_password'] = 'Chang4me3!'