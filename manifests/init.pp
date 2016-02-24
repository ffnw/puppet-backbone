class backbone (
  
) inherits backbone::params {

  class { 'backbone::config': }

  contain backbone::config

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
