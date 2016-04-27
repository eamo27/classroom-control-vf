class nginx {
  package { 'nginx': 
    ensure => present,
    before => File['nginx'],
  }
  file { 'nginx': 
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    notify => Service['nginx'],
  }
  service { 'nginx': 
    ensure => running,
    enable => true,
    }
}
  
  

