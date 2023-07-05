



resource "cloudflare_record" "a_gustavo" {
  zone_id = var.cloudflare_zone_id_ohkillsh
  name    = "terraform"
  value   = "192.0.2.1"
  type    = "A"
  proxied = true
  ttl     = 1
}


resource "cloudflare_record" "cname_gustavo" {
  zone_id    = data.cloudflare_zone.main.id
  name       = "terraform-cname"
  value      = cloudflare_record.a_gustavo.hostname
  type       = "CNAME"
  ttl        = 1
  proxied    = true
  depends_on = [resource.cloudflare_record.a_gustavo]

}



