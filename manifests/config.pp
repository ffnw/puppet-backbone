class backbone::config inherits backbone {

  include router

  file_line { 'backbone-ip_gre':
    path => '/etc/modules',
    line => 'ip_gre',
  }

  $ip.each | $value | {
    network::inet::loopback::post_up { "backbone ${value}":
      cmd => "/bin/ip -4 addr add ${value} dev \$IFACE",
    }
  }

  $ip6.each | $value | {
    network::inet6::loopback::post_up { "backbone ${value}":
      cmd => "/bin/ip -6 addr add ${value} dev \$IFACE",
    }
  }

}

