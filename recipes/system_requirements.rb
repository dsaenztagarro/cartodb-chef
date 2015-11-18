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

package 'curl'

node_version = node['cartodb']['system_requirements']['node']['version']
user_name = node['cartodb']['system_requirements']['user']['name']
user_password = node['cartodb']['system_requirements']['user']['password']
user_home = node['cartodb']['system_requirements']['user']['home']
deploy_path = node['cartodb']['system_requirements']['deploy']['path']

source_path = "source #{user_home}/.nvm/nvm.sh"

ruby_block 'install_nvm' do
  block do
    cmd = Mixlib::ShellOut.new(
      "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash",
      user: user_name, password: user_password, cwd: deploy_path)
    cmd.run_command
    cmd.error!
  end
end

ruby_block 'install_node' do
  block do
    cmd = Mixlib::ShellOut.new(
      "bash -c '#{source_path} && nvm install #{node_version}'",
      user: user_name, password: user_password, cwd: deploy_path)
    cmd.run_command
    cmd.error!

    cmd = Mixlib::ShellOut.new(
      "bash -c '#{source_path} && nvm use #{node_version}'",
      user: user_name, password: user_password, cwd: deploy_path)
    cmd.run_command
    cmd.error!

    cmd = Mixlib::ShellOut.new(
      "bash -c '#{source_path} && nvm alias default #{node_version}'",
      user: user_name, password: user_password, cwd: deploy_path)
    cmd.run_command
    cmd.error!
  end
end
