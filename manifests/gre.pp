define backbone::gre (
  String           $endpoint,
  String           $transfer,
  Optional[String] $transfer6 = undef,
) {

  include backbone
  include backbone::params

  validate_ip_address($endpoint)
  validate_ip_address($transfer)

  if !has_ip_address($endpoint) {
    network::inet::tunnel { "bb-${title}":
      address   => ip_address($transfer),
      mode      => 'gre',
      endpoint  => ip_address($endpoint),
    }
    if is_ip_address($transfer6) {
      network::inet6::static { "bb-${title}":
        address   => $transfer6,
      }
    }
  }

}

