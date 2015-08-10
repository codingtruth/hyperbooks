#!/bin/awk


BEGIN {
	ABC ="אבגדהוזחטיכלמנסעפצקרשת"

	printf "<h1>%s %s</h1>", "חלק", substr(ABC, pn*2-1, 2)

	i = 1
}

{
	if (match( $0, "<li><a href=\"/heb/content/view/full/([0-9]+)\">([א-ת ]+)</a></li>", a))
	{
		n = substr( $0, a[1, "start"], a[1, "length"])
		
		ig = substr( $0, a[2, "start"], a[2, "length"])
		
		if ((pn == 2 || pn == 3) && i == 1)
		{
			i = 2
		}
		
		if (pn == 3 && i == 109)
		{
			i = 111
		}
		
		if (pn == 3 && i == 116)
		{
			i = 117
		}
		
		if (pn == 3 && i == 123)
		{
			i = 124
		}
		
		if (i > 1 && i != gematria(ig))
		{
			printf "ERROR: %d != %s", i, ig
		}

		if (pn == 2 && n == 22288)
		{
			printf "<p>part %d page <b>%d</b>: CHARSET ENCODING ERROR ON <a href=\"http://www.kab.co.il/heb/content/view/full/%d\">www.kab.co.il</a></p>", pn, i, n
		}
		else
		{
			cmd = sprintf("awk -f htmh-zoarpage.awk src-htm/part%d-%03d.html", pn, n)
			system(cmd)
		}
		
		i++
	}

}


function gematria(ss,   s,g,n,l,i,c)
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