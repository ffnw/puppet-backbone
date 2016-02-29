define backbone::gre (
  String           $endpoint,
  String           $transfer,
  Optional[String] $transfer6 = undef,
) {

  include backbone
  include backbone::params

  validate_ip_address($endpoint)
  validate_ip_address($transfer)

  $kernel_table = $backbone::kernel_table
  if ($kernel_table) {
    $ip4_rule_up   = [ "/bin/ip -4 rule add pref 31000 iif \$IFACE table ${kernel_table}",
                       "/bin/ip -4 rule add pref 31001 iif \$IFACE unreachable", ]
    $ip6_rule_up   = [ "/bin/ip -6 rule add pref 31000 iif \$IFACE table ${kernel_table}",
                       "/bin/ip -6 rule add pref 31001 iif \$IFACE unreachable", ]
    $ip4_rule_down = [ "/bin/ip -4 rule del pref 31000 iif \$IFACE table ${kernel_table}",
                       "/bin/ip -4 rule del pref 31001 iif \$IFACE unreachable", ]
    $ip6_rule_down = [ "/bin/ip -6 rule del pref 31000 iif \$IFACE table ${kernel_table}",
                       "/bin/ip -6 rule del pref 31001 iif \$IFACE unreachable", ]
  } else {
    $ip4_rule_up   = []
    $ip6_rule_up   = []
    $ip4_rule_down = []
    $ip6_rule_down = []
  }

  if !has_ip_address($endpoint) {
    network::inet::tunnel { "bb-${title}":
      address   => $transfer,
      mode      => 'gre',
      endpoint  => $endpoint,
      pre_up    => $ip4_rule_up,
      post_down => $ip4_rule_down,
    }
    if is_ip_address($transfer6) {
      network::inet6::static { "bb-${title}":
        address   => $transfer6,
        pre_up    => $ip6_rule_up,
        post_down => $ip6_rule_down,
      }
    }
  }

}

