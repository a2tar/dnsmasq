class dnsmasq::service {
	service { "dnsmasq":
		ensure      => running,
		hasstatus   => true,
		hasrestart  => true,
		enable      => true,
		require     => Class["dnsmasq::install"],
	}
}