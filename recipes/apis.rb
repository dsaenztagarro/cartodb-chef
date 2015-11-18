#
# Cookbook Name:: cartodb
# Recipe:: apis
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

deploy_path = node['cartodb']['deploy']['path']

bash 'install-sql-api' do
  cwd deploy_path
  code <<-EOH
    git clone git://github.com/CartoDB/CartoDB-SQL-API.git
    cd CartoDB-SQL-API
    npm install
  EOH
end

# TODO: Fix npm install errors
# TODO: Add again commands:
#     npm install
#     cp config/environments/development.js.example config/environments/development.js
#     node app.js development
bash 'install-maps-api' do
  cwd deploy_path
  code <<-EOH
    git clone git://github.com/CartoDB/CartoDB-SQL-API.git
    cd CartoDB-SQL-API
    git checkout master
  EOH
end
