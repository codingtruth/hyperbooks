#!/bin/awk

BEGIN {
	html_start()

		print "<p style=\"text-align:center;font-family:Miriam;font-size:7pt\">" "Downloaded from: " "<a style=\"font-family:Miriam;font-size:7pt;text-decoration:underline;\" href=http://mechon-mamre.org/i/t/t0.htm>http://mechon-mamre.org/i/t/t0.htm</a> at " strftime("%H:%M:%S %Z %b %d %Y",systime())
		
	system("awk -f htmh-torapage.awk src-htm/t01.htm")
	system("awk -f htmh-torapage.awk src-htm/t02.htm")
	system("awk -f htmh-torapage.awk src-htm/t03.htm")
	system("awk -f htmh-torapage.awk src-htm/t04.htm")
	system("awk -f htmh-torapage.awk src-htm/t05.htm")

	html_end()
}

function html_start()
{
  	printf "<!DOCTYPE html><html dir=RTL style=\"width: 100%; height: 100%;\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1255\">"
    printf "<style>"
    printf "h1 {font-size:18pt;font-family:David;text-align:center;}"
    printf "h2 {font-size:14pt;font-family:David;text-align:center;page-break-inside:avoid;}"
    printf "h3 {font-size:12pt;font-family:David;text-align:right;margin-top:8pt;}"
    printf "h4 {font-size:10pt;font-family:David;text-align:right;margin-top:8pt;}"
    printf "small {font-size:10pt;font-family:times;text-align:right;margin-top:6pt;}"
    printf "p {font-family:David; font-size:12pt; margin-top:4pt; margin-bottom:4pt; text-align:justify;}"
    printf "p.d1 {margin-top:14pt;margin-top:6pt; margin-bottom:4pt;}"
    printf "p.rb {font-size:10pt; text-indent: 12pt; margin-top:4pt;margin-bottom:6pt;}"
    printf "a {color:black; text-decoration:none;}"
    printf "a.r {color:black; font-size:12pt; font-family:Miriam; text-decoration:none;}"
    printf "</style>"
    printf "</head><body style=\"margin: 0; padding: 0;\">"
}

function html_end()
{
	printf "</body></html>"
}
