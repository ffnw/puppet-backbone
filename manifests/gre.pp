define backbone::gre (
  String           $endpoint,
  String           $transfer,
  Optional[String] $transfer6 = undef,
) {

  validate_ip_address($endpoint)
  validate_ip_address($transfer)

  if !has_ip_address($endpoint) {
    network::inet::tunnel { "bb-${title}":
      address  => $transfer,
      mode     => 'gre',
      endpoint => $endpoint,
    }
    if is_ip_address($transfer6) {
      network::inet6::static { "bb-${title}":
        address => $transfer6,
      }
    }
  }

}

