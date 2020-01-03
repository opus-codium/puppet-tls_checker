# @summary Configure tls_checker
#
# @param logfile Logfile to store certificates status
# @param ensure
#
# @param hour
# @param minute
# @param month
# @param monthday
# @param weekday
#
# @param user User to check TLS status as
# @param group Group to check TLS status as
class tls_checker (
  String $logfile = '/var/log/tls-checker.jsonl',
  String $ensure  = 'installed',

  Any $hour     = '*/4',
  Any $minute   = fqdn_rand(60),
  Any $month    = undef,
  Any $monthday = undef,
  Any $weekday  = undef,

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
