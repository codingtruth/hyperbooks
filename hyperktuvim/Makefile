
get:
	rm -rf src-htm
	mkdir src-htm
	awk -f wget-ktuvimmain.awk filelist.txt

htm:
	rm -rf out-htm
	mkdir out-htm
	cat filelist.txt | awk -f htmh-ktuvimmain.awk
pdf: htm
	rm -rf out-pdf
	mkdir out-pdf
	cat filelist.txt | awk -f pdf-ktuvimmain.awk

all: get htm pdf