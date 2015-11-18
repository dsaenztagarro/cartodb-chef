#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'apt-get update'

bash 'system_locales' do
  code <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

package 'build essentials' do
  package_name %w(autoconf binutils-doc bison build-essential flex)
end

package %w(git mercurial)

package 'apt-tools' do
  package_name 'python-software-properties'
end
