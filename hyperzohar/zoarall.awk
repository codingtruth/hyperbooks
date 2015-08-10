#!/bin/awk

BEGIN {

	for (i = 19664; i <= 24175; i++)
	{
		cmd = sprintf("wget -o log-wget.txt -O src-htm/%d.html http://www.kab.co.il/heb/content/view/full/%d", i, i)
		
		system(cmd)
		
	}
	
}