[![Build Status](https://travis-ci.org/dsaenztagarro/cartodb-chef.svg?branch=master)](https://travis-ci.org/dsaenztagarro/cartodb-chef)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/cartodb-chef/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/cartodb-chef)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/cartodb-chef/badge.svg?branch=master&service=github)](https://coveralls.io/github/dsaenztagarro/cartodb-chef?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/cartodb-chef.svg)](https://gemnasium.com/dsaenztagarro/cartodb-chef)

cartodb Cookbook
================

This cookbook aims to automate the CartoDB installation from [official documentation][1]

Requirements
------------

#### Platforms
- Ubuntu 12.04 LTS

#### Chef
- Chef 12.2.0

#### Cookbooks
- rvm

#### packages
- `default` - full cartodb installation 

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### cartodb::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cartodb']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----

#### cartodb::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `cartodb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cartodb]"
  ]
}
```

Running integration tests
-------------------------

```
bundle
berks
vagrant box add ubuntu-12.04-LTS http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box
kitchen test
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: David Saenz Tagarro


[1](http://cartodb.readthedocs.org/en/latest/install.html)
