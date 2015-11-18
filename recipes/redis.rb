#
# Cookbook Name:: cartodb
# Recipe:: redis
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

bash 'add-repo-redis' do
  code <<-EOH
    add-apt-repository ppa:cartodb/redis
    apt-get update
  EOH
end

execute 'install-redis' do
  command 'apt-get install -y redis-server'
end
