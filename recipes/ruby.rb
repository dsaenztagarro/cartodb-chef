#
# Cookbook Name:: cartodb
# Recipe:: ruby
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

node.default['rvm']['user']['name'] = 'vagrant'
node.default['rvm']['user']['password'] = 'vagrant'
node.default['rvm']['user']['dir'] = '/home/vagrant'

node.default['rvm']['rubies']['version'] = '1.9.3'

include_recipe 'rvm::user_install'
include_recipe 'rvm::rubies'
