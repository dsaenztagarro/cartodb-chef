require 'spec_helper'

describe 'railsapp::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '12.04') do |node|
      node['cartodb']['editor']['rails_env'] = 'development'
    end.converge described_recipe
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
