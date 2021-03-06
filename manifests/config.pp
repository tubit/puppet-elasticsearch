# == Class: elasticsearch::config
#
class elasticsearch::config inherits elasticsearch::params {
    $clustername = $elasticsearch::clustername
    $node_master = true
    $node_data = true

    file {
        $elasticsearch::params::config_file:
            content => template('elasticsearch/elasticsearch.yml.erb'),
            require => Class['elasticsearch::package'];

        $elasticsearch::params::config_log:
            content => template('elasticsearch/logging.yml.erb'),
            require => Class['elasticsearch::package'];

    }

    case $::operatingsystem {
        'Debian': {
            file {
                '/etc/default/elasticsearch':
                    content => template('elasticsearch/debian-default-elasticsearch.erb'),
                    require => Class['elasticsearch::package'];
            }
        }
    }
}
