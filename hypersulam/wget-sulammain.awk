#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/akd-001-003.html http://www.kab.co.il/heb/content/view/full/125452")
	cmd("wget -o log-wget.txt -O src-htm/akd-001-004s.html http://www.kab.co.il/heb/content/view/full/125453")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
