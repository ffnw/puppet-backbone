class backbone (
  Optional[String] $kernel_table = $backbone::params::kernel_table,
) inherits backbone::params {

  class { 'backbone::config': }

  contain backbone::config

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
