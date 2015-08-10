#!/bin/awk -f


BEGIN {
	s = 0
	p = -1
	
	hdrs_num = 0
	cont_num = 0
	
	# title_id, lang_id are passed via -v, and used for links' ids
	
	heb_num_init()
}

END {
	printf "<h2 id=%s_%s_h2><a href=#%s_%s_h2_tbl>%s</a></h2>\n", lang_id, title_id, lang_id, title_id, title_txt

	printf "<p id=%s_%s_h4_00_tbl><a class=r_%s href=#%s_%s_h4_00  style=\"text-decoration:underline;\">[0]</a></p>\n", lang_id, title_id, lang_id, lang_id, title_id

	for (i = 1; i <= hdrs_num; i++) {
		printf "<p id=%s_%s_h4_%02d_tbl><a class=r_%s href=#%s_%s_h4_%02d>%s</a></p>\n", lang_id, title_id, i, lang_id, lang_id, title_id, i, hdrs_txt[i]
	}
	
	printf "<br>"
	
	printf "<h3 id=%s_%s_h4_00 class=%s><a href=#%s_%s_h4_00_tbl  style=\"text-decoration:underline;\">[0]</a></h3>\n", lang_id, title_id, lang_id, lang_id, title_id
	
	for (i = 1; i <= cont_num; i++) {
		print cont_txt[i]
	}
}

{
	if (match($0, /<h2>([^<]+)<\/h2>/, m)) {
		title_txt = substr($0, m[1, "start"], m[1, "length"])
		next
	} else
	if (match($0, /<h4>([^<]+)<\/h4>/, m)) {
		hdrs_num++
		hdrs_txt[hdrs_num] = substr($0, m[1, "start"], m[1, "length"])
		$0 = sprintf("\n<h3 id=%s_%s_h4_%02d class=%s><a href=#%s_%s_h4_%02d_tbl>%s</a></h3>\n", lang_id, title_id, hdrs_num, lang_id, lang_id, title_id, hdrs_num, hdrs_txt[hdrs_num])
	} else
	if (match($0, /^<p><b>([0-9]+)\)<\/b>(.+)(<\/p>(<\/li><\/ol>)?)/, m)) {
		par_i   = 0 + substr($0, m[1, "start"], m[1, "length"])
		par_id  = sprintf( "%s_%03d", title_id, par_i)
		par_txt = substr($0, m[2, "start"], m[2, "length"])
		par_fin = substr($0, m[3, "start"], m[3, "length"])
		$0 = sprintf("<p><a href=#heb_%s><b id=rus_%s>%s)</b></a>%s <a class=rrh href=#heb_%s>[ע]</a>%s", par_id, par_id, par_i, par_txt, par_id, par_fin)
	} else
	if (match($0, /^<p><b>([א-ת]+)\)<\/b>(.+)(<\/p>(<\/li><\/ol>)?)/, m)) {
		par_ih  = substr($0, m[1, "start"], m[1, "length"])
		par_i   = heb_num(par_ih)
		par_id  = sprintf( "%s_%03d", title_id, par_i)
		par_txt = substr($0, m[2, "start"], m[2, "length"])
		par_fin = substr($0, m[3, "start"], m[3, "length"])
		$0 = sprintf("<p><a href=#rus_%s><b id=heb_%s>%s)</b></a>%s <a class=rrh href=#rus_%s>[р]</a>%s", par_id, par_id, par_ih, par_txt, par_id, par_fin)
	}
	
	cont_num++
	cont_txt[cont_num] = $0
}

function heb_num_init()
{
	ABC ="אבגדהוזחטיכלמנסעפצקרשת"
}

function heb_num(ss,   s,g,n,l,i,c)
{
    is_vav_first = 0
	s = ss
	gsub(/[^א-ת]/, "", s)
	g = 0
	l = length(s)
	n_prev = 1000
	o_next = 1000
    
	for (i = 1; i <= l; i+=2) {
		c = substr(s, i, 2)
		n = (index(ABC, c) + 1) / 2
		if (n >= 10 && n <= 19) {
			n = (n - 9) * 10
		} else if (n >= 20) {
			n = (n - 18) * 100
		}
		if (n > 0) {

			g += n

            if (n == 6 && g == 6)
                is_vav_first = 1
			else if (n >= o_next && !((n == 6 || n == 7) && ((g - n) % 100 == 9)))
                return 0

			if (n >= 100)
				o_next = 100
			else if (n >= 10)
				o_next = 10
			else if (g != 6)
				o_next = 0
		}
	}
    if (is_vav_first == 1 && g > 6)
        g -= 6
	return g
}