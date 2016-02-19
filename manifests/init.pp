class backbone (
  
) inherits backbone::params {

  contain backbone::config

  class { 'backbone::config': }

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
