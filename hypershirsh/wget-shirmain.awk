#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/t30.htm http://mechon-mamre.org/i/t/t30.htm")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
