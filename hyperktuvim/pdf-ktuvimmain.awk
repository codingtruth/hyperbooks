#!/bin/awk

BEGIN {
	HTM2PDF = "../../../utils/wkhtmltox-0.12.2.3_mingw-w64-cross-win64/bin/wkhtmltopdf"
	HTM2PDF_PARAMS = " --print-media-type --page-width 46mm --page-height 92mm --margin-top 1mm --margin-bottom 1mm --margin-left 0.25mm --margin-right 0.25mm --dpi 300 --disable-smart-shrinking"

	htm2pdf = HTM2PDF " " HTM2PDF_PARAMS
}

{
	print "'" htm2pdf "'"
	scmd = sprintf(htm2pdf " " "out-htm/%s.htm out-pdf/heb_%s_v1_46mm.pdf", $2, $2)
	print scmd
	system(scmd)
}
