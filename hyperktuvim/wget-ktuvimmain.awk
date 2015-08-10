#!/bin/awk

{
	scmd = sprintf("wget -o log-wget.txt -O src-htm/%s.htm http://mechon-mamre.org/i/t/t%s.htm", $2, $1)
	system(scmd)
}
