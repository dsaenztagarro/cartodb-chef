#
# Cookbook Name:: cartodb
# Recipe:: default
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

recipes = %w(system_requirements
             postgresql
             postgis
             redis
             apis
             ruby
             editor)

recipes.each { |recipe| include_recipe "cartodb::#{recipe}" }
