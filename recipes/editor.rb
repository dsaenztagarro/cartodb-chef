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

bash 'download-editor' do
  cwd deploy_path
  code <<-EOH
    git clone --recursive https://github.com/CartoDB/cartodb.git
    cd cartodb
  EOH
end

bash 'create-config-files' do
  code <<-EOH
    RAILS_ENV=#{rails_env} bundle exec rake db:setup
    RAILS_ENV=#{rails_env} bundle exec rake db:migrate
  EOH
end
