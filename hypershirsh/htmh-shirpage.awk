#!/bin/awk -f


BEGIN {
	RS = "[<>]"
	s = 0
	p = -1
}

s==1 && /^\/B$/ {s=3; p=0; next}
/^B$/ {s=1; next}

s==3 && /^\/BODY$/ {exit}
/^BODY$/ {s=3; next}

{
    gsub(/[[:cntrl:]\t]+/, "", $0)
    gsub(/^[[:blank:][:cntrl:]]+/, "", $0)
    gsub(/[[:blank:][:cntrl:]]+$/, "", $0)

	if (s==1) {
		printf "<B><SMALL>" $0 "</SMALL></B> "
	} else
	if (s==3) {
		if (p==-1) {print $0; p=1}
		else if (p==1) {printf "<" $0 ">"; p=0}
		else if (p==0) {printf $0; p=1}
	}	
}
