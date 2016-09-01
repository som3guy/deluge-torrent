#
# Cookbook Name:: deluge-torrent
# Recipe:: default
#
# Copyright 2016
#
# All rights reserved - Do Not Redistribute
#
# Attibutes
error = ''
if node['platform_version'].to_f >= 7.0
  node.default['deluge']['release'] = 7
elsif node['platform_version'].to_f >= 6.0
  node.default['deluge']['release'] = 6
else
  error = 'Please use a supported OS and version'
end
raise error unless error.empty?

# Recipes
include_recipe 'deluge-torrent::yum_setup'

if node['deluge']['release'] == 7
  include_recipe 'deluge-torrent::deluge_server_7'
elsif node['deluge']['release'] == 6
  include_recipe 'deluge-torrent::deluge_server_6'
end

