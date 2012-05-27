$pdf_mode = 1;
$pdflatex = 'pdflatex -halt-on-error -synctex=1 %O %S';

add_cus_dep('svg', 'pdf', 0, 'svg2pdf' );
sub svg2pdf {
   system("inkscape -D -z --file=$_[0].svg --export-pdf=$_[0].pdf");
}
