if :notexists source.fqdn && :notexists source.url && :notexists source.ip && :notexists source.network{
	drop
}

if :notexists source.fqdn && :notexists source.url && :exists source.ip{
	path "ip_only"
}

if (:exists source.fqdn || :exists source.url) && :notexists source.ip{
	path "url_only"
}

if ((:exists source.fqdn || :exists source.url) && :exists source.ip) || :exists source.network{
	path "has_all"
}
