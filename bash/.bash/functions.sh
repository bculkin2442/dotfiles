# Functions

# Count the number of pages in a pdf
function pdfpgcount {
	mutool pages "$1" |\
	grep pagenum |\
	tail -1 |\
	grep -o -e "\".*\"" |\
	cut -d\" -f2;
}

# Summarize page count of all pdfs in a directory
function countallpdfs {
	for fname in *.pdf */*.pdf; do 
		echo "$fname: " `pdfpgcount "$fname"` "pages";
	done;
}

# Split a pdf by its highest level bookmarks
function splitpdf {
	splitpdf -bLevel 1 -iFile "$1";
}

# List all available fonts known to font-config/Xft
function fontlist {
	fc-list : family | cut -d, -f2 | sort
}

# Count unique lines of input
function uniqcount {
	sort | uniq | sort -n
}

# Run a command for each argument
function foreach {
	com="$1"
	shift 1
	for arg in "$@"; do
		"$com" "$arg";
	done;
}

# Convert a document written with groff's MS macros to pdf
function ms2pdf {
	groff -ms "$1" | ps2pdf - "${1%.ms}.pdf"
}

# Preview a document written with groff's MS macros
function previewms {
	ms2pdf "$1";
	mupdf-gl "${1%.ms}.pdf";
	rm "${1%.ms}.pdf";
}

# Convert a document written with groff's ME macros to pdf
function me2pdf {
	groff -me "$1" | ps2pdf - "${1%.me}.pdf"
}

# Preview a document written with groff's ME macros
function previewme {
	me2pdf "$1";
	mupdf-gl "${1%.me}.pdf";
	rm "${1%.me}.pdf";
}

# Pause until the enter key is hit
function pause {
	read -p "$1"
}

# Manually duplex print a Postscript file
function lprduplex {
	psselect -e "$1" | lpr -P "$2";
	pause "Reinsert printed pages";
	psselect -o "$1" | lpr -P "$2";
}

# Create a maven project
function mvncreate {
	mvn archetype:generate -DartifactId="$1" -DgroupId="$2"
}
