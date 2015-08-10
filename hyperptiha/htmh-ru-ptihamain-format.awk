#!/bin/awk

BEGIN {
	bs_ptiha_id = "heb_bs_ptiha"
	ru_ptiha_id = "rus_bs_ptiha"
	
	html_start()

		print "<p id=notice_top dir=ltr style=\"text-align:center;font-family:Miriam;font-size:7pt\">" "Downloaded and converted to PDF from: <a href=#notice_bot style=\"text-decoration:underline;\"><b>[*]</b></a> " "<a style=\"font-family:Miriam;font-size:7pt;text-decoration:underline;\" href=http://www.kab.co.il/heb/content/view/full/27219>http://www.kab.co.il/heb/content/view/full/27219</a>,  <a style=\"font-family:Miriam;font-size:7pt;text-decoration:underline;\" href=http://www.kabbalah.info/rus/content/view/full/55167>http://www.kabbalah.info/rus/content/view/ full/55167</a>  at " strftime("%H:%M:%S %Z %b %d %Y",systime()) " </p>"

	printf "<hr>"
	
	printf "<p id=%s_h2_tbl style=\"text-align:center\"><a class=r1h href=#%s_h2>" "הרב יהודה אשלג, בעל הסולם<br>פתיחה לחכמת הקבלה" "</a></p>", bs_ptiha_id, bs_ptiha_id
	
	printf "\n<div dir=\"ltr\">\n<p id=%s_h2_tbl style=\"text-align:center\"><a class=r1r href=#%s_h2>" "Йегуда Ашлаг<br>(Бааль Сулам)<br>Введение в науку Каббала (Птиха)" "</a></p>\n</div>\n", ru_ptiha_id, ru_ptiha_id
	
	printf "<hr>"

	system("awk -v lang_id=heb -v title_id=bs_ptiha -f htmh-bs-ptihapage-format.awk out-htm/heb_bs_ptiha_utf_extracted.htm")

	printf "<hr>"

	printf "\n<div class=\"rus\" dir=\"ltr\">\n"
	system("awk -v lang_id=rus -v title_id=bs_ptiha -f htmh-bs-ptihapage-format.awk out-htm/rus_bs_ptiha_utf_extracted.htm")
	printf "\n</div>\n"

	printf "<hr>"

		print "<p id=notice_bot dir=ltr style=\"text-align:justify;  font-family:Miriam;font-size:9pt\"><br>" "<a href=#notice_top  style=\"text-decoration:underline;\"><b>[*]</b></a> Free open source framework for pages download and conversion, which guarantees that original texts remain autentic and all rights are reserved to their respective owners.</p>"

		print "<p dir=ltr style=\"text-align:center;font-family:Miriam;font-size:9pt\"><br>" "Technical notice:<br><b>all hyperlinks within this PDF are clickable, even those which are not underlined.</b></p>"

		print "<p id=notice_bot dir=ltr style=\"text-align:center;font-family:Miriam;font-size:9pt\">Technical questions regarding pages dowloading and conversion:<br><br><a href=mailto:codingtruth@gmail.com><b style=\"font-size:10pt\">codingtruth@gmail.com</b></a></p>"

		
		print "<br>"
		
		print "<p id=notice_bot dir=ltr style=\"text-align:justify;font-family:Miriam;font-size:7pt\"><br>Бесплатная система c открытым исходным кодом для скачивания интернет-страниц и преобразования их в PDF, гарантирующая сохранение аутентичности оригинальных текстов и сохранение всех прав за их соответствующими правообладателями.</p>"

		print "<p dir=ltr style=\"text-align:center;font-family:Miriam;font-size:7pt\"><br>" "Технические замечания:<br><b>по всем гиперссылкам в этом файле можно переходить, даже по тем, которые не подчеркнуты.</b></p>"
		
		print "<p id=notice_bot dir=ltr style=\"text-align:center;font-family:Miriam;font-size:7pt\">По техническим вопросам касательно скачивания и конвертации интернет страниц обращаться по адресу:<br><br><a href=mailto:codingtruth@gmail.com><b style=\"font-size:10pt\">codingtruth@gmail.com</b></a></p>"
	html_end()
}

function html_start()
{
  	printf "<!DOCTYPE html><html dir=RTL style=\"width: 100%; height: 100%;\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
    printf "<style>"
    printf "h1 {font-size:18pt;font-family:times;text-align:center;}"
    printf "h2 {font-size:16pt;font-family:times;text-align:center;page-break-inside:avoid;}"
    printf "h2.heb {font-size:16pt;font-weight:bold; font-family:times;text-align:center;page-break-inside:avoid;}"
    printf "h2.rus {font-size:16pt;font-weight:bold; font-family:times;text-align:center;page-break-inside:avoid;}"
    printf "h3 {font-size:12pt;font-family:times;text-align:right;margin-top:8pt;margin-bottom:4pt}"
    printf "h3.heb {font-size:12pt;font-family:times;text-align:right;margin-top:8pt;margin-bottom:4pt}"
    printf "h3.rus {font-size:12pt;font-family:times;text-align:left;margin-top:8pt;margin-bottom:4pt}"
    printf "h4 {font-size:10pt;font-family:times;text-align:right;margin-top:8pt;}"
    printf "h4.heb {font-size:10pt;font-family:times;text-align:right;margin-top:8pt;}"
    printf "h4.rus {font-size:10pt;font-family:times;text-align:left;margin-top:8pt;}"
    printf "div.rus {font-family:Times; font-size:10pt; margin-top:4pt; margin-bottom:4pt; text-align:justify;}"
    printf "p {font-family:Times; font-size:12pt; margin-top:4pt; margin-bottom:4pt; text-align:justify;}"
    printf "p.d1 {margin-top:14pt;margin-top:6pt; margin-bottom:4pt;}"
    printf "p.rb {font-size:10pt; text-indent: 12pt; margin-top:4pt;margin-bottom:6pt;}"
    printf "a {color:black; text-decoration:none;}"
    printf "a.r     {color:black; font-size:12pt; font-family:Miriam; text-decoration:none;}"
    printf "a.r_heb {color:black; font-size:12pt; font-family:Miriam; text-decoration:none; text-align:right;}"
    printf "a.r_rus {color:black; font-size:10pt; font-family:Tahoma; text-decoration:none; text-align:left;}"
    printf "a.r1h {color:black;font-weight:bold;font-size:14pt; font-family:Tahoma; text-decoration:none;}"
    printf "a.r1r {color:black;font-weight:bold;font-size:12pt; font-family:Tahoma; text-decoration:none;}"
    printf "a.rrh {color:black; font-size:8pt; font-family:Arial; text-decoration:underline;}"
    printf "</style>"
    printf "</head><body style=\"margin: 2pt; padding: 0;\">"
}

function html_end()
{
	printf "</body></html>"
}
