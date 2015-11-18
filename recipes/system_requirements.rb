#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'apt-get update'

bash 'system-locales' do
  code <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

package 'build-essentials' do
  package_name %w(autoconf binutils-doc bison build-essential flex)
end

package 'git'

package 'apt-tools' do
  package_name 'python-software-properties'
end

# nodejs

execute 'add-apt-repo node' do
  command 'add-apt-repository ppa:cartodb/nodejs-010'
end

execute 'apt-get update' do
  command 'apt-get update'
end

package 'nodejs'
