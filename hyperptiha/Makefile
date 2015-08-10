HTM2PDF = ../../../utils/wkhtmltox-0.12.2.3_mingw-w64-cross-win64/bin/wkhtmltopdf
HTM2PDF_PARAMS = \
	--encoding windows-1255 \
	--print-media-type \
	--page-width 46mm --page-height 92mm  \
	--margin-top 1mm --margin-bottom 1mm --margin-left 0.25mm --margin-right 0.25mm \
	--dpi 300 \
	--disable-smart-shrinking \
	--zoom 0.90

ICONV = ../../../utils/win-iconv-master/win_iconv.exe
ICONV_2WIN_PARAMS = -f utf8 -t windows-1255
ICONV_2UTF_PARAMS = -f DETECTED_CHARSET -t utf8

get:
	rm -rf src-htm
	mkdir src-htm
	awk -f wget-ptihamain.awk srclist.txt

htm:	
	rm -rf out-htm
	mkdir out-htm
	cat src-htm/bs_ptiha.htm | awk -f htmh-bs-ptihapage-extract.awk | \
                           awk -f htmh-bs-ptihapage-extract2.awk > out-htm/heb_bs_ptiha_utf_extracted.htm
	cat src-htm/ru_ptiha.htm | awk -f htmh-bs-ptihapage-extract.awk | \
                           awk -f htmh-bs-ptihapage-extract2.awk > out-htm/rus_bs_ptiha_utf_extracted.htm
	rm -rf out-htm/tmp.htm
	awk -f htmh-ru-ptihamain-format.awk >> out-htm/heb_rus_bs_ptiha_utf_formated.htm

enc:
	$(ICONV) $(ICONV_2WIN_PARAMS) out-htm/heb_sulam_utf.htm > out-htm/heb_sulam_v1.htm
	cat out-htm/heb_sulam_v1.htm | awk '{sub(/charset=utf-8/, "charset=Windows-1255"); print;}' > out-htm/tmp.htm
	rm -rf out-htm/heb_sulam_v1.htm
	mv out-htm/tmp.htm out-htm/heb_sulam_v1.htm
	
pdf:
	rm -rf out-pdf
	mkdir out-pdf
	$(HTM2PDF) $(HTM2PDF_PARAMS) out-htm/heb_rus_bs_ptiha_utf_formated.htm out-pdf/heb_rus_bs_ptiha_v1_46mm.pdf

all:	get htm pdf