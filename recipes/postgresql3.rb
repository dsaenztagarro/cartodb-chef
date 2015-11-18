#
# Cookbook Name:: cartodb
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#


bash 'install-schema-triggers-2' do
  cwd '/home/vagrant'
  code <<-EOH
    hg clone https://bitbucket.org/malloclabs/pg_schema_triggers
    cd pg_schema_triggers
    make
    sudo make
  EOH
end
