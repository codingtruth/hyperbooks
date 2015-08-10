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
	awk -f wget-shirmain.awk

htm:
	rm -rf out-htm
	mkdir out-htm
	awk -f htmh-shirmain.awk >> out-htm/heb_shir-ha-shirim_hdrs.htm
pdf: htm
	rm -rf out-pdf
	mkdir out-pdf
	rm -rf heb_shir-ha-shirim_v1_46mm.pdf
	$(HTM2PDF) $(HTM2PDF_PARAMS) out-htm/heb_shir-ha-shirim_hdrs.htm out-pdf/heb_shir-ha-shirim_v1_46mm.pdf

all: get htm pdf