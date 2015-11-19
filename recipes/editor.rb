#
# Cookbook Name:: cartodb
# Recipe:: editor
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

rails_env = node['cartodb']['editor']['rails_env']
deploy_path = node['cartodb']['deploy']['path']
deploy_user = node['cartodb']['deploy']['user']
deploy_group = node['cartodb']['deploy']['group']

deploy_editor_path = File.join(deploy_path, 'cartodb')

execute 'git-clone-editor' do
  cwd deploy_path
  command 'git clone git://github.com/CartoDB/cartodb.git'
  user deploy_user
  group deploy_group
  not_if { ::File.directory? deploy_editor_path }
end

bash 'editor-db:setup' do
  cwd deploy_editor_path
  command "RAILS_ENV=#{rails_env} bundle exec rake db:setup"
end

bash 'editor-db:migrate' do
  cwd deploy_editor_path
  command "RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
end
