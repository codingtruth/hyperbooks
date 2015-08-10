#!/bin/awk

BEGIN {
	html_start()

		print "<p style=\"text-align:center;font-family:Miriam;font-size:7pt\">" "Downloaded from: " "<a style=\"font-family:Miriam;font-size:7pt;text-decoration:underline;\" href=http://www.kab.co.il/heb/content/view/full/65725>http://www.kab.co.il/heb/content/view/ full/65725 </a> at " strftime("%H:%M:%S %Z %b %d %Y",systime())
		
	printf "<title>" "זוהר לעם" "</title>"
	
	system("awk -f htmh-sulampage.awk src-htm/akd-001-003.html")
	system("awk -f htmh-sulampage.awk src-htm/akd-001-004s.html")
	html_end()
}

function html_start()
{
  	printf "<!DOCTYPE html><html dir=RTL style=\"width: 100%; height: 100%;\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
    printf "<style>"
    printf "h1 {font-size:18pt;font-family:times;text-align:center;}"
    printf "h2 {font-size:14pt;font-family:times;text-align:center;page-break-inside:avoid;}"
    printf "h3 {font-size:12pt;font-family:times;text-align:right;margin-top:8pt;}"
    printf "h4 {font-size:10pt;font-family:times;text-align:right;margin-top:8pt;}"
    printf "p {font-family:Times; font-size:12pt; margin-top:4pt; margin-bottom:4pt; text-align:justify;}"
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
