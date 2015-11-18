#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

bash 'apt-add-repositories' do
  code <<-EOH
    apt-add-repository --yes ppa:cartodb/postgresql-9.3
    apt-add-repository --yes ppa:cartodb/gis
    add-apt-repository ppa:cartodb/nodejs-010
    apt-get update
  EOH
end

# TODO: Review documentation. Check apt-repository 'ppa:cartodb/postgresql-9.3'
# bash 'fix-add-app-repository' do
#   code <<-EOH
#     sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
#     wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#     apt-get update
#   EOH
# end

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

# bash 'install-schema-triggers' do
#   code <<-EOH
#     add-apt-repository ppa:cartodb/pg-schema-trigger
#     apt-get update
#     apt-get install postgresql-9.3-pg-schema-triggers
#   EOH
# end


bash 'install-schema-triggers-2' do
  cwd '/home/vagrant'
  code <<-EOH
    hg clone https://bitbucket.org/malloclabs/pg_schema_triggers
    cd pg_schema_triggers
    make
    sudo make
  EOH
end

cookbook_file '/etc/postgresql/9.3/main/postgresql.conf' do
  source 'postgresql.conf'
end

cookbook_file '/etc/postgresql/9.3/main/pg_hba.conf' do
  source 'pg_hba.conf'
end

execute 'restart-postgresql' do
  command 'service postgresql restart'
end

# GIS dependencies

package 'install-proj' do
  package_name %w(proj proj-bin proj-data libproj-dev)
end

package 'install-json' do
  package_name %w(libjson0 libjson0-dev python-simplejson)
end

package 'install-geos' do
  package_name %w(libgeos-c1v5 libgeos-dev)
end

package 'install-gdal' do
  package_name %w(gdal-bin libgdal1-dev)
end

# NODEJS

package %w(nodejs npm)

bash 'sql-api' do
  cwd '/home/vagrant'
  code <<-EOH
    git clone git://github.com/CartoDB/CartoDB-SQL-API.git
    cd CartoDB-SQL-API
    git checkout master
    npm install
    cp config/environments/development.js.example config/environments/development.js
    node app.js development
  EOH
end

# POSTGIS

# install postgis
package 'install-postgis' do
  package_name %w(libxml2-dev liblwgeom-2.1.8 postgis postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-2.1-scripts)
end

# initialize template postgis database
bash 'initialize-template' do
  code <<-EOH
    createdb -T template0 -O postgres -U postgres -E UTF8 template_postgis
    createlang plpgsql -U postgres -d template_postgis
    psql -U postgres template_postgis -c 'CREATE EXTENSION postgis;CREATE EXTENSION postgis_topology;'
    ldconfig
  EOH
end

# TODO: Review documentation. Branch 'cdb' doesn't exist anymore:
#   `git checkout cdb`
bash 'install-cartodb-postgresql-extension' do
  cwd '/home/vagrant'
  code <<-EOH
    git clone https://github.com/CartoDB/cartodb-postgresql.git
    cd cartodb-postgresql
    sudo make install
    sudo PGUSER=postgres make installcheck
  EOH
end
#
# bash 'create-users' do
#   code <<-EOH
#     createuser publicuser --no-createrole --no-createdb --no-superuser -U postgres
#     createuser tileuser --no-createrole --no-createdb --no-superuser -U postgres
#   EOH
# end
