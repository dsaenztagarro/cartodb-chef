#
# Cookbook Name:: cartodb
# Recipe:: apis
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

# SQL API

deploy_path = node['cartodb']['deploy']['path']
deploy_sql_api_path = File.join(deploy_path, 'CartoDB-SQL-API')
deploy_maps_api_path = File.join(deploy_path, 'Windshaft-cartodb')

execute 'git-clone-sql-api' do
  cwd deploy_path
  command 'git clone git://github.com/CartoDB/CartoDB-SQL-API.git'
  user 'vagrant'
  not_if { ::File.directory? deploy_sql_api_path }
end

execute 'npm-install-sql-api' do
  command "bash -c 'source /home/vagrant/.nvm/nvm.sh && npm install'"
  cwd "#{deploy_path}/CartoDB-SQL-API"
  user 'vagrant'
end

# MAPS API

package %w(pkg-config libcairo2-dev libjpeg8-dev libgif-dev libpango1.0-dev)

execute 'git-clone-maps-api' do
  cwd deploy_path
  command 'git clone git://github.com/CartoDB/Windshaft-cartodb.git'
  user 'vagrant'
  not_if { ::File.directory? deploy_maps_api_path }
end

execute 'npm-install-maps-api' do
  command "bash -c 'source /home/vagrant/.nvm/nvm.sh && npm install'"
  cwd "#{deploy_path}/Windshaft-cartodb"
  user 'vagrant'
end

execute 'gen-config-maps-api' do
  cwd deploy_maps_api_path
  command 'cp config/environments/development.js.example config/environments/development.js'
  user 'vagrant'
  not_if { ::File.exist? 'config/environments/development.js' }
end
