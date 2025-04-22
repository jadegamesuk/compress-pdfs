#!/usr/bin/bash

OIFS="$IFS"
IFS=$'\n'

for INPUTPDF in `find * -type f -name "*.pdf"`  
do
    echo "Processing file: $INPUTPDF"
    OUTPUTPDF=$(echo $INPUTPDF | cut -sd '/' -f2)    

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageResolution=150 -dColorImageResolution=150 -dGrayImageResolution=150 -sOutputFile=output/$OUTPUTPDF $INPUTPDF

    echo -e "Completed processing file: output/$OUTPUTPDF \n"

done
IFS="$OIFS"
