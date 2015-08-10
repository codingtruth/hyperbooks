#!/bin/awk -f


BEGIN {
	RS = "[<>]"
	s = 0
	p = -1
}

// {gsub(/[[:cntrl:]\t]+/, "")}
s==1 && /\/h1/ {s=2; next}
/h1/ {s=1; next}
s==2 && /div id=\"body\"/ {s=3; next}
s==3 && /\/div/ {exit}
s==3 && /h4 class="center"/ {printf "<h4>"; p=0; next}
#s==3 && /\/p/ {printf "</p>\n"; inpar=0; p=0; next}
#s==3 && /p/ {printf "<p>"; inpar=1; p=0; next}
{
	if (s==1) {
		printf "<h2>" $0 "</h2>"
	} else
	if (s==3) {
		if (p==-1) {print $0; p=1}
		else if (p==1) {printf "<" $0 ">"; p=0}
		else if (p==0) {printf $0; p=1}
	}	
}
