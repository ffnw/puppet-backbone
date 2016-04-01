class backbone::config inherits backbone {

  include router

  file_line { 'backbone-ip_gre':
    path => '/etc/modules',
    line => 'ip_gre',
  }

  $ip.each | $value | {
    network::inet::loopback::post_up { "/bin/ip -4 addr add ${value} dev \$IFACE": }
  }

  $ip6.each | $value | {
    network::inet6::loopback::post_up { "/bin/ip -6 addr add ${value} dev \$IFACE": }
  }

  $nets_self_plus = $nets_self.map | $value | { "${nets_self}+" }
  $nets_self6_plus = $nets_self6.map | $value | { "${nets_self6}+" }

  file {
    default:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644';
    '/etc/bird/bird.conf.d/backbone.conf':
      content => epp('backbone/ospf.epp', { nets_self_plus => $nets_self_plus });
    '/etc/bird/bird6.conf.d/backbone.conf':
      content => epp('backbone/ospf6.epp', { nets_self6_plus => $nets_self6_plus });
  }

}

