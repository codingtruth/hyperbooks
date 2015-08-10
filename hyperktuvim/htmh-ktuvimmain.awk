#!/bin/awk

{
	scmd = sprintf("awk -v book=%s -f htmh-ktuvimbook.awk > out-htm/%s.htm", $2, $2)
	system(scmd)
}

