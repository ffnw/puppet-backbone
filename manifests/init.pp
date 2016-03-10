class backbone (
  Array[String]                     $ip           = $backbone::params::ip,
  Array[String]                     $ip6          = $backbone::params::ip6,
) inherits backbone::params {

  class { 'backbone::config': }

  contain backbone::config

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
