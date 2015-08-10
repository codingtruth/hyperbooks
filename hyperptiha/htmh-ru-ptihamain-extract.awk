#!/bin/awk

BEGIN {
	system("awk -f htmh-bs-ptihapage-extract.awk src-htm/ru_ptiha.htm")
}
