#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'add-app-repository' do
  command 'add-apt-repository ppa:cartodb/postgresql-9.3'
end

bash 'fix-add-app-repository' do
  code <<-EOH
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    apt-get update
  EOH
end

package 'install-client-packages' do
  package_name %w(libpq5
                  libpq-dev
                  postgresql-client-9.3
                  postgresql-client-common)
end

package 'install-server-packages' do
  package_name %w(postgresql-9.3
                  postgresql-contrib-9.3
                  postgresql-server-dev-9.3
                  postgresql-plpython-9.3)
end

bash 'install-schema-triggers' do
  code <<-EOH
    add-apt-repository ppa:cartodb/pg-schema-trigger
    apt-get update
    apt-get install postgresql-9.3-pg-schema-triggers
  EOH
end
