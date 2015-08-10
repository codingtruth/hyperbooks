#!/bin/awk

{
	scmd = sprintf("wget -o log-wget.txt -O src-htm/%s.htm %s", $1, $2)
	cmd(scmd)
}

function cmd(scmd)
{
	while (system(scmd) != 0) {
		printf "Download failed, retrying... \n   %s\n", scmd
	}
}
