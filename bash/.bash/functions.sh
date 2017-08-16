# Functions

# Count the number of pages in a pdf
function pdfpgcount {
	mutool pages "$1" | grep pagenum | tail -1 | grep -o -e "\".*\"" | cut\
	-d\" -f2;
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
