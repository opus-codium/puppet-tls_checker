class tls_checker (
  String $logfile = '/var/log/tls-checker.jsonl',
  String $ensure  = 'installed',

  $hour     = '*/4',
  $minute   = fqdn_rand(60),
  $month    = undef,
  $monthday = undef,
  $weekday  = undef,

  Optional[String] $user  = 'nobody',
  Optional[String] $group = 'nogroup',
) {
  package { 'tls-checker':
    ensure   => $ensure,
    provider => 'gem',
  }

  file { $logfile:
    ensure => file,
    owner  => $user,
    group  => $group,
    mode   => '0644',
  }

  $args = tls_checker::watched_endpoints().join(' ')

  cron { 'tls-checker':
    command  => "/usr/local/bin/tls-checker -o ${logfile} ${args}",

    hour     => $hour,
    minute   => $minute,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday,

    user     => $user,
  }
}
