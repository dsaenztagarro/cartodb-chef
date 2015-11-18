
# Dependencies

bash 'apt-repo-gis' do
  code <<-EOH
    add-apt-repository ppa:cartodb/gis
    apt-get update
  EOH
end

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
  package_name %w(gdal-bin libgdal1-dev libgdal-dev ogr2ogr2-static-bin)
end

# Installation

package 'install-postgis' do
  package_name %w(libxml2-dev liblwgeom-2.1.8 postgis postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-2.1-scripts)
end

bash 'initialize-template' do
  code <<-EOH
    createdb -T template0 -O postgres -U postgres -E UTF8 template_postgis
    createlang plpgsql -U postgres -d template_postgis
    psql -U postgres template_postgis -c 'CREATE EXTENSION postgis;CREATE EXTENSION postgis_topology;'
    ldconfig
  EOH
end
