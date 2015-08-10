#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/t26.htm http://mechon-mamre.org/i/t/t26.htm")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
