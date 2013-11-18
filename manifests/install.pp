class dnsmasq::install (
	$ensure  = 'installed',
	$package = 'dnsmasq',
){
	package { $package :
	    ensure  => $ensure,
	}
}
