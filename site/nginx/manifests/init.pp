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
  
  file { 'nginx-html': 
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  service { 'nginx': 
    ensure => running,
    enable => true,
    }
}
  
  
