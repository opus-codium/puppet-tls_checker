# summary Add TLS endpoints to monitor
#
# @param endpoints Endpoints to monitor
define tls_checker::watch (
  Variant[Array[String], String] $endpoints = $title,
) {
}
