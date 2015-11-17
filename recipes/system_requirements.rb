#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

bash 'system_locales' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

package 'build essentials' do
  package_name %w(autoconf binutils-doc bison build-essential flex)
end

package 'apt-tools' do
  package_name 'python-software-properties'
end
