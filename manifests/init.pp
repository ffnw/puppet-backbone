class backbone (
  
) inherits backbone::params {

  contain backbone::config

  class { 'backbone::config': }

}
