# Public: Install nodenv so ohmyfish versions can be installed
#
# Usage:
#
#   include ohmyfish

class ohmyfish(
  $ohmyfish_root    = $ohmyfish::params::ohmyfish_root,
  $ohmyfish_user    = $ohmyfish::params::ohmyfish_user,
  $ohmyfish_version = $ohmyfish::params::ohmyfish_version,
  $ohmyfish_repo    = $ohmyfish::params::ohmyfish_repo,
) inherits ohmyfish::params {

  repository { $ohmyfish_root:
    ensure => $ohmyfish_version,
    force  => true,
    source => $ohmyfish_repo,
    user   => $ohmyfish_user
  }

  if $::osfamily == 'Darwin' {
    include boxen::config

    file { "${boxen::config::envdir}/ohmyfish.fish":
      ensure => absent,
    }

    boxen::env_script { 'ohmyfish':
      extension => 'fish',
      priority  => 'higher',
      source    => 'puppet:///modules/ohmyfish/ohmyfish.fish',
    }
  }
}