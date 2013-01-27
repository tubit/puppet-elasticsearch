# == Define: elasticsearch::plugin
#
define elasticsearch::plugin (
    $ensure = 'present',
    $module_dir = undef 
) {
    include elasticsearch::params
    
    if !$module_dir {
        fail("module_dir undefined: you need to specify module destination directory for plugin ${title}")
    }

    case $ensure {
        'installed', 'present': {
            exec {"install-plugin-${title}":
                command => "${elasticsearch::params::bin_plugin} -install ${title}",
                creates  => "${elasticsearch::params::dir_plugins}/${module_dir}";
            }
        }
        default: {
            exec {"remove-plugin-${title}":
                command => "${elasticsearch::params::bin_plugin} -remove ${title}";
            }
        }
    } 
}
