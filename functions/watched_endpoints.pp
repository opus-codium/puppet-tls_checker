function tls_checker::watched_endpoints() >> Array[String] {
  $pql = "resources [parameters] { type = 'Tls_checker::Watch' and certname = '${trusted['certname']}' }"
  puppetdb_query($pql).map |$value| { $value.dig('parameters', 'endpoints') }.flatten.unique.sort
}
