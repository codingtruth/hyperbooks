#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/akdrus-001-006.html http://www.kabbalah.info/rus/content/view/full/81353")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
