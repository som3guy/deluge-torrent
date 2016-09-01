#
# Cookbook Name:: deluge-torrent
# Recipe:: deluge_server_7
#
# Copyright 2016
#
# All rights reserved - Do Not Redistribute
#
yum_package 'deluge' do
  action :install
  version "#{node['deluge']['version']}.el#{node['deluge']['release']}.nux"
end

if node['deluge']['logs']['enabled']
  node.default['deluge']['daemon']['logs']['file'] = '-l /var/log/deluge/daemon.log'
  node.default['deluge']['daemon']['logs']['level'] = '-L warning'
  node.default['deluge']['web']['logs']['file'] = '-l /var/log/deluge/web.log'
  node.default['deluge']['web']['logs']['level'] = '-L warning'
  directory '/var/log/deluge' do
    owner 'deluge'
    group 'deluge'
    mode '750'
    action :create
  end
  template '/etc/logrotate.d/deluge' do
    source 'logrotate_deluge.erb'
    owner 'root'
    group 'root'
    mode '644'
  end
end

services = ['deluged', 'deluge-web']
services.each do |svc|
  template "/etc/systemd/system/#{svc}.service" do
    source "#{svc}.service.erb"
    owner 'root'
    group 'root'
    mode '644'
  end
end

services.each do |svc|
  service svc do
    action [:enable, :start]
  end
end

# template '/var/lib/deluge/.config/deluge/web.conf' do
#   source 'web.conf.erb'
#   owner 'deluge'
#   group 'deluge'
#   mode '644'
# end
