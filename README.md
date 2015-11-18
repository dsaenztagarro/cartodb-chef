cartodb Cookbook
================

This cookbook aims to automate the CartoDB installation from [official documentation][1]

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - cartodb needs toaster to brown your bagel.

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
Authors: TODO: List authors


[1](http://cartodb.readthedocs.org/en/latest/install.html)
