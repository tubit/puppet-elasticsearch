# == Class: elasticsearch::plugin::head
#
class elasticsearch::plugin::head (
    $ensure = 'installed' 
) inherits elasticsearch::params {
    elasticsearch::plugin{'mobz/elasticsearch-head': module_dir => 'head', ensure => $ensure; } 
}
