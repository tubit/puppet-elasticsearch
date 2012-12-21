#######################################################
# Class: elasticsearch::package
#
class elasticsearch::package inherits elasticsearch::params {
    package {
        'elasticsearch':
            name   => $elasticsearch::package,
            ensure => $elasticsearch::version;
    }
}
