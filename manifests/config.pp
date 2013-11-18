class dnsmasq::config (
	$ip      = '',
	$network = '',
	$ensure  = present,
) {
	include dnsmasq::install
	include dnsmasq::service

	file { "dnsmasq-openvpn.conf" :
		path    => "/etc/dnsmasq.d/dnsmasq-openvpn.conf",
		ensure  => $ensure,
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
		content => template("dnsmasq/dnsmasq-openvpn.conf.erb"),
		require => Class["dnsmasq::install"],
		notify  => Class["dnsmasq::service"],
	}

	file { "dnsmasq" :
		path    => "/etc/default/dnsmasq",
		ensure  => $ensure,
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
		source  => "puppet:///modules/dnsmasq/default/dnsmasq",
		require => Class["dnsmasq::install"],
		notify  => Class["dnsmasq::service"],
	}
}
