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

node_version = node['cartodb']['system_requirements']['node']['version']

execute 'install-nvm' do
  command 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash'
end

bash 'install-node' do
  code <<-EOH
    nvm install #{node_version}
    nvm use #{node_version}
    nvm alias default #{node_version}
  EOH
end
