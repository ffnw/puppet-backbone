class backbone (
  Array[String] $ip         = $backbone::params::ip,
  Array[String] $ip6        = $backbone::params::ip6,
  Array[String] $nets_self  = $backbone::params::nets_self,
  Array[String] $nets_self6 = $backbone::params::nets_self6,
) inherits backbone::params {

  class { 'backbone::config': }

  contain backbone::config

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
