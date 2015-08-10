#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/t01.htm http://mechon-mamre.org/i/t/t01.htm")
	cmd("wget -o log-wget.txt -O src-htm/t02.htm http://mechon-mamre.org/i/t/t02.htm")
	cmd("wget -o log-wget.txt -O src-htm/t03.htm http://mechon-mamre.org/i/t/t03.htm")
	cmd("wget -o log-wget.txt -O src-htm/t04.htm http://mechon-mamre.org/i/t/t04.htm")
	cmd("wget -o log-wget.txt -O src-htm/t05.htm http://mechon-mamre.org/i/t/t05.htm")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
