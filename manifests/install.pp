class dnsmasq::install ($ensure = 'installed', $package = 'dnsmasq',) {
  include apt

  package { $package:
    ensure  => $ensure,
    require => Class["apt::update"],
  }
}

