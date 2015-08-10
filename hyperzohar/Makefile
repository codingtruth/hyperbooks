HTM2PDF = ../../../utils/wkhtmltox-0.12.2.3_mingw-w64-cross-win64/bin/wkhtmltopdf
HTM2PDF_PARAMS = \
	--encoding windows-1255 \
	--print-media-type \
	--page-width 46mm --page-height 92mm  \
	--margin-top 1mm --margin-bottom 1mm --margin-left 0.25mm --margin-right 0.25mm \
	--dpi 300 \
	--disable-smart-shrinking

ICONV = ../../../utils/win-iconv-master/win_iconv.exe
ICONV_2WIN_PARAMS = -f utf8 -t windows-1255
ICONV_2UTF_PARAMS = -f DETECTED_CHARSET -t utf8

fix-src-htm:
	# doesn't work
	$(ICONV) $(ICONV_2UTF_PARAMS) src-htm/part2-22288.html > src-htm/tmp.htm
	#rm -rf src-htm/part2-22288.html
	#mv
htm:	
	rm -rf out-htm
	mkdir out-htm
	awk -f htmh-zoarmain.awk >> out-htm/aram_zohar_v1_utf.htm

enc:
	$(ICONV) $(ICONV_2WIN_PARAMS) out-htm/aram_zohar_v1_utf.htm > out-htm/aram_zohar_v1.htm
	cat out-htm/aram_zohar_v1.htm | awk '{sub(/charset=utf-8/, "charset=Windows-1255"); print;}' > out-htm/tmp.htm
	rm -rf out-htm/aram_zohar_v1.htm
	mv out-htm/tmp.htm out-htm/aram_zohar_v1.htm
	
pdf:
	rm -rf out-pdf
	mkdir out-pdf
	$(HTM2PDF) $(HTM2PDF_PARAMS) out-htm/aram_zohar_v1.htm out-pdf/aram_zohar_v1_46mm.pdf