class memcached {

  package { 'memcached': 
    ensure => present,
    before => File['memcached'],
  }
  file { 'memcached': 
    ensure => file,
    path => '/etc/sysconfig/memcached',
    source => 'puppet:///modules/memcached/files/memcached',
    notify => Service['memcached'],
  }
  service { 'memcached': 
    ensure => running,
    enable => true,
  }
}
