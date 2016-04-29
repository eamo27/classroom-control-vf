class profile::wordpress {

  $mysql_root_pw = hiera('profile::wordpress::mysql_root_pw')
  $mysql_root_pw = hiera('profile::wordpress::docroot')
  $mysql_root_pw = hiera('profile::wordpress::user')
  $mysql_root_pw = hiera('profile::wordpress::pass')
  $mysql_root_pw = hiera('profile::wordpress::group')
  $mysql_root_pw = hiera('profile::wordpress::db_user')
  $mysql_root_pw = hiera('profile::wordpress::db_name')
  $mysql_root_pw = hiera('profile::wordpress::db_pass')

  include vsftpd
  
    user { '$wp_user':
        ensure => present,
        gid    => $wp_group,
        comment => "${wp_user} account",
        password => $wp_pass,
        managehome => true,
    }

}
