HTM2PDF = ../../../utils/wkhtmltox-0.12.2.3_mingw-w64-cross-win64/bin/wkhtmltopdf
HTM2PDF_PARAMS = \
	--print-media-type \
	--page-width 46mm --page-height 92mm  \
	--margin-top 1mm --margin-bottom 1mm --margin-left 0.25mm --margin-right 0.25mm \
	--dpi 300 \
	--disable-smart-shrinking

get:
	rm -rf src-htm
	mkdir src-htm
	awk -f wget-naviimmain.awk filelist.txt

htm:
	rm -rf out-htm
	mkdir out-htm
	cat filelist.txt | awk -f htmh-naviimmain.awk >> out-htm/heb_naviim_hdrs.htm
pdf: htm
	rm -rf out-pdf
	mkdir out-pdf
	$(HTM2PDF) $(HTM2PDF_PARAMS) out-htm/heb_naviim_hdrs.htm out-pdf/heb_naviim_v1_46mm.pdf

all: get htm pdf