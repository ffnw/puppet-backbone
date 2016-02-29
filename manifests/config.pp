class backbone::config {

  include router

  file_line { 'backbone-ip_gre':
    path => '/etc/modules',
    line => 'ip_gre',
  }

}

