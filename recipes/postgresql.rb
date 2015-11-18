#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

bash 'add-repo-postgresql' do
  code <<-EOH
    apt-add-repository --yes ppa:cartodb/postgresql-9.3
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

bash 'apt-repo-pg-schema-trigger' do
  code <<-EOH
    add-apt-repository ppa:cartodb/pg-schema-trigger
    apt-get update
  EOH
end

package 'postgresql-9.3-pg-schema-triggers'

cookbook_file '/etc/postgresql/9.3/main/postgresql.conf' do
  source 'postgresql.conf'
end

cookbook_file '/etc/postgresql/9.3/main/pg_hba.conf' do
  source 'pg_hba.conf'
end

execute 'restart-postgresql' do
  command 'service postgresql restart'
end

include_recipe 'cartodb::postgis'

# TODO: Add installcheck command once fixed tests
#   sudo PGUSER=postgres make installcheck
bash 'install-cartodb-postgresql-extension' do
  cwd '/home/vagrant'
  code <<-EOH
    git clone https://github.com/CartoDB/cartodb-postgresql.git
    cd cartodb-postgresql
    sudo make install
  EOH
end
