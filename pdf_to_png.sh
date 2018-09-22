#!/bin/bash

# Convert each page to a PNG
pdftoppm -r 300 -png -f 0 /private/tmp/FOIA\ Chapman\ -\ Senate\ Republican\ Documents\ \ \(pages\ 1\ through\ copy.pdf /tmp/foia-gop

# List of PNGs to one big OCR'd PDF
find /tmp/foia-gop-*.png | sort | tesseract -c stream_filelist=true - - pdf > /tmp/foia-gop-ocred.pdf

# Use tabula to get a CSV of the odd page numbers
java -jar Downloads/tabula-1.0.2-jar-with-dependencies.jar --pages $(python -c "print ','.join([str(x) for x in range(1,660,2)])") -c 16.5,100,342 --area 66.8,16.87,545.83,835.32 ~/foia-gop-ocred.pdf > foia-gop-ocred.csv
