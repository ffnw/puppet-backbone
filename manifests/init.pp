class backbone (
  
) inherits backbone::params {

  require backbone::config

  create_resources('backbone::gre', hiera('backbone::gre', {}))

}
