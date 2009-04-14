#!/bin/bash
# Compile file with right tool based on file extension.
# If Makefile exists in direcotory, then run make.

function run() {
    echo $@
    $@
}

function build_tex() {
    LATEX_ARGS=-halt-on-error
    FILENAME=$1

    MASTER=`grep -oP '(?<=%% master:) [-_\.\w]*' $FILENAME`
    if [ -n "$MASTER" ]
        then FILENAME=$MASTER
    fi

    PREFIX=`grep -oP '(?<=%% prefix:) [-_\.\w]*' $FILENAME`
    if grep -Fq $'\pdfoutput=1' $FILENAME
        then PREFIX='pdf'
    fi

    if grep -Fq $'\starttext' $FILENAME
        then texexec $FILENAME
    elif grep -Fq $'\usepackage{slovak}\n\usepackage{czech}' $FILENAME
        then run ${PREFIX}cslatex $LATEX_ARGS $FILENAME
        else run ${PREFIX}latex $LATEX_ARGS $FILENAME
    fi
}

FILENAME=$1
if [ -f Makefile -o -f makefile ]
    then run make
elif [ -f SConstruct ]
    then run scons -Q
else
    EXT=${FILENAME##*.}
    case "$EXT" in
    "tex")
        build_tex $FILENAME
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
        run pychecker $FILENAME
        ;;
    "markdown")
        run markdown $FILENAME -f ${FILENAME%.markdown}.html
        ;;
    "texy")
        echo "texy $FILENAME > ${FILENAME%.texy}.html"
        ~/bin/texy $FILENAME > ${FILENAME%.texy}.html
        ;;
    "txt")
        run asciidoc $FILENAME
        ;;
    *)
        echo "I don't know how to build your file"
        ;;
    esac
fi
