# Elasticsearch module for puppet

Debian only for now. You need to add the debian package from
http://www.elasticsearch.org/download/
to your local repository.

## Example usage
```
class {'elasticsearch': 
    clustername => 'ElasticCluster',
    version     => '0.19.10',
    package     => 'elasticsearch'
}
```

## Plugins

There are plenty of plugins available for elasticsearch, have a look
at http://www.elasticsearch.org/guide/reference/modules/plugins.html 
for more informiation.

Install "elasticsearch-head" plugin:
```
elasticsearch::plugin{'mobz/elasticsearch-head': module_dir => 'head'; }
```

### Example: the head plugin

The head-plugin is a nice web based gui for elasticsearch. Installation:

```
include elasticsearch::plugin::head
```

