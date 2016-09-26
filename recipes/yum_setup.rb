#
# Cookbook Name:: deluge-torrent
# Recipe:: yum_setup
#
# Copyright 2016
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum'
include_recipe 'yum-epel'

yum_repository 'Nux_Dextop' do
  description 'Nux Dextop Repo'
  baseurl "http://li.nux.ro/download/nux/dextop/el#{node['deluge']['release']}/$basearch/ http://mirror.li.nux.ro/li.nux.ro/nux/dextop/el#{node['deluge']['release']}/$basearch/"
  gpgkey 'http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro'
  action :create
end
