output "ip_address" {
    value = "${data.phpipam_first_free_address.next_address.ip_address}"
}