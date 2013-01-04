#!/bin/bash
# Compile file with right tool based on file extension.
# If Makefile exists in current direcotory, then run make.

function run() {
    echo $@
    $@
}

function find_tex_master() {
    FILENAME=$1
    MASTER=`grep -oP '(?<=% mainfile:) [-_\.\w]*' $FILENAME`
    if [ -z "$MASTER" ]
        then MASTER=$FILENAME
    fi
    echo $MASTER
}

FILENAME=$1
if [ -f Makefile -o -f makefile ]
    then run make
else
    EXT=${FILENAME##*.}
    case "$EXT" in
    "tex")
        FILENAME=`find_tex_master $FILENAME`
        TEX_PATTERNS="*.{aux,bbl,blg,fdb_latexmk,fls,log,out,toc,tof}"
        if [ -e _tex ]
            then eval mv _tex/$TEX_PATTERNS . 2> /dev/null
        fi
        run latexmk $FILENAME
        RC=$?
        if [ ! -e _tex ]
            then mkdir _tex
        fi
        eval mv $TEX_PATTERNS _tex 2> /dev/null
        exit $RC
        ;;
    "java")
        run javac $FILENAME
        ;;
    "c")
        run gcc -Wall -o ${FILENAME%.c} $FILENAME
        ;;
    "cc")
        run g++ -Wall -o ${FILENAME%.cc} $FILENAME
        ;;
    "cpp")
        run g++ -Wall -o ${FILENAME%.cpp} $FILENAME
        ;;
    "py")
        run pyflakes $FILENAME
        ;;
    "less")
        run lessc $FILENAME ${FILENAME%.less}.css
        ;;
    "markdown")
        run markdown $FILENAME -f ${FILENAME%.markdown}.html
        ;;
    "texdown")
        if [ -f inheader.tex ]; then
            run markdown2pdf --include-in-header=inheader.tex $FILENAME
        elif [ -f template.tex ]; then
            run markdown2pdf --template=template.tex $FILENAME
        else
            run markdown2pdf $FILENAME
        fi
        ;;
    *)
        echo "I don't know how to build your file"
        ;;
    esac
fi
