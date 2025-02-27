#!/usr/bin/env perl
 
# $latex = 'platex %O %S';
# $bibtex = 'pbibtex %O %S';
# $biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
# $makeindex = 'mendex %O -o %D %S';
# $dvipdf = 'dvipdfmx %O -o %D %S';

## latex commands
$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex -kanji=utf8';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;

## pdf mode
$pdf_mode         = 3; # 0: none, 1: pdflatex, 2: ps2pdf, 3: dvipdfmx