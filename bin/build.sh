#!/bin/bash
# Compile file with right tool based on file extension.
# If Makefile exists in direcotory, then run make.

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
elif [ -f SConstruct ]
    then run scons -Q
else
    EXT=${FILENAME##*.}
    case "$EXT" in
    "tex")
        FILENAME=`find_tex_master $FILENAME`
        run rubber --pdf $FILENAME
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
