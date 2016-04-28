define users::managed_user (
  $ensure = 'present',
   $manahehome = true,
   $shell     = '/bin/bash',
   $groups = undef,
   $group = $title,
   $home = "$/home/${title}",
)
{
  user { $title:
    ensure => $ensure,
    manahehome => $managehome,
    shell => $shell,
    gid => $gid,
    groups => $groups,
    home => $home,
    }
    
  if $ensure == 'present' {
  group { $group:
    ensure => present,
    }
  file { ${home}/.ssh:
    ensure => directory,
    group => $group,
    owner => $title,
    mode => '0750'
  }
 }
}
