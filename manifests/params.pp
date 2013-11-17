# Public: Configuration for ohmyfish

class ohmyfish::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $ohmyfish_user = $::boxen_user
      $ohmyfish_root = "${boxen::config::home}/oh-my-fish"
    }

    default: {
      $ohmyfish_user = 'root'
      $ohmyfish_root = '/usr/local/share/oh-my-fish'
    }
  }

  $ohmyfish_repo = 'bpinto/oh-my-fish'
  $ohmyfish_version = 'master'
}
