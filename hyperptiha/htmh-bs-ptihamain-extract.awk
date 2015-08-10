#!/bin/awk

BEGIN {
	system("awk -f htmh-bs-ptihapage-extract.awk src-htm/bs_ptiha.htm")
}
