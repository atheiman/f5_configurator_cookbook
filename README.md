# f5_configurator_cookbook

Configures a utility node to send API requests to an f5 BIGIP Local Traffic Manager. These API requests can create, update, and delete LTM objects.

# Concept

f5 BIGIP objects can *only* easily be managed with the [iControl REST API|https://devcentral.f5.com/downloads/icontrol/docs/icontrolrest-userguide.pdf]. The utility node configured by this cookbook hits this api and creates LTM objects that do not exist, update LTM objects that exist different than expected, and deletes LTM objects that exist that should not.

An `f5_config_data_bag` contains a data bag item for each set of objects to exist in the f5. This data bag could contain the following items:

```
$ knife data bag show f5-ltm-objects
virtual-servers
profiles
policies
pools
health-monitors
nodes
irules
data-group-lists
route-domains
vlans
certs
keys
```

Each of these data bag items looks something like:

```JSON
{
  "id": "<object type>",              # data bag id ("virtual-servers", "policies", etc.)
  "objects": [                        # an array of the object type for this data bag item
    {
      "name": "some_object",          # all objects have a name
      "partition": "some_partition",  # the partition to create the object in
      "propertyA": "value a",         # other property and value pairs related to the object
      "propertyB": "value b",
    },
    {
      "name": "another_object",
      "propertyA": "value a",         # partition omitted, defaults to common
      "propertyB": "value b",
    }
  ]
}
```

# Attributes

Attribute | Notes
--------- | -----
`f5_config_data_bag` | Holds data bag items for each object type to be configured in f5.
`api_base_url` | iControle REST API base url. Example: `'https://10.11.12.13/mgmt/tm/'`.
