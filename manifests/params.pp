#######################################################
# Class: elasticsearch::params
#
# Default values for elasticsearch installations
#
class elasticsearch::params {
    $clustername = 'ElasticCluster'
    $version = '0.19.10'

    case $::operatingsystem {
        'Debian': {
            $package     = 'elasticsearch'
            $service     = 'elasticsearch'
            $config_file = '/etc/elasticsearch/elasticsearch.yml'
            $config_log  = '/etc/elasticsearch/logging.yml'
            $dir_base    = '/usr/share/elasticsearch'
            $dir_plugins = "${dir_base}/plugins"
            $bin_plugin  = '/usr/share/elasticsearch/bin/plugin'

        }
        default: {
            fail("sorry, I don't know how to support ${::operatingsystem}")
        }
    }
}
