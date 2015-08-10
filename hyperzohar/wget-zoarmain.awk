#!/bin/awk

BEGIN {

	cmd("wget -o log-wget.txt -O src-htm/index.html http://www.kab.co.il/heb/content/view/full/19660")
	cmd("wget -o log-wget.txt -O src-htm/part1.html http://www.kab.co.il/heb/content/view/full/19661")
	cmd("wget -o log-wget.txt -O src-htm/part2.html http://www.kab.co.il/heb/content/view/full/19662")
	cmd("wget -o log-wget.txt -O src-htm/part3.html http://www.kab.co.il/heb/content/view/full/19663")

	system("awk -v pn=1 -f wget-zoarpart.awk src-htm/part1.html")
	system("awk -v pn=2 -f wget-zoarpart.awk src-htm/part2.html")
	system("awk -v pn=3 -f wget-zoarpart.awk src-htm/part3.html")
}


function cmd(scmd)
{
	while (system(scmd) != 0){}
}
