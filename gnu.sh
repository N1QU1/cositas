#!/usr/bin/bash

#Ploting with gnuplot
echo ""
echo "--------------PLOTS--------------"
echo ""
echo "1)Plot different Data"
echo "2)Compare to a function"
echo "3)Histogram"
read -p "Choose what you want to do: " OPTION

COMILLAS='"'
CONTRABARRA='\'
TYPE="png"

case "$OPTION" in
 [1])
    echo ""
    echo "--------------Ploting diferent data--------------"
    echo ""

    read -p "Set output: " OUTPUT
    read -p "Set title: " TITLE
    read -p "Set xlabel: " XLABEL
    read -p "Set ylabel: " YLABEL
    read -p "Number of plots: " Num

    echo "set terminal $TYPE" > Ploting.txt
    echo "set output $COMILLAS$OUTPUT.$TYPE$COMILLAS" >> Ploting.txt
    echo "set title $COMILLAS$TITLE$COMILLAS" >> Ploting.txt
    echo "set xlabel $COMILLAS$XLABEL$COMILLAS" >> Ploting.txt
    echo "set ylabel $COMILLAS$YLABEL$COMILLAS" >> Ploting.txt
    
    for (( i=1 ; i<=$Num ; i++ ))
    do
        DATA="$DATA$i"
        COLUMN="$COLUMN$i"
        NAME_COLUMN="$NAME_COLUMN$i"
        read -p "DATA FILE: " DATA
        read -p "Column: " COLUMN
        read -p "Name of the line: " NAME_COLUMN

        case $i in
        1)
            echo "plot ${COMILLAS}${DATA}${COMILLAS} using 1:$COLUMN title ${COMILLAS}${NAME_COLUMN}${COMILLAS} with lines, ${CONTRABARRA}" >> Ploting.txt
            ;;
        $Num)
            echo "${COMILLAS}${DATA}${COMILLAS} using 1:$COLUMN title ${COMILLAS}${NAME_COLUMN}${COMILLAS} with lines" >> Ploting.txt
            ;;
        *) 
            echo "${COMILLAS}${DATA}${COMILLAS} using 1:$COLUMN title ${COMILLAS}${NAME_COLUMN}${COMILLAS} with lines, ${CONTRABARRA}" >> Ploting.txt
            ;;
        esac
    done
 ;;

 [2])
    echo ""
    echo "--------------Comparison of a function with a column--------------"
    echo ""

    read -p "Set output: " OUTPUT
    read -p "Set title: " TITLE
    read -p "Set xlabel: " XLABEL
    read -p "Set ylabel: " YLABEL
    read -p "Function: " FUNCTION
    read -p "DATA FILE: " DATA
    read -p "Column: " COLUMN
    read -p "Name of the line: " NAME_COLUMN

    echo "set terminal $TYPE" > Ploting.txt
    echo "set output $COMILLAS$OUTPUT.$TYPE$COMILLAS" >> Ploting.txt
    echo "set title $COMILLAS$TITLE$COMILLAS" >> Ploting.txt
    echo "set xlabel $COMILLAS$XLABEL$COMILLAS" >> Ploting.txt
    echo "set ylabel $COMILLAS$YLABEL$COMILLAS" >> Ploting.txt
    echo "f(x)=a*$FUNCTION(x)+b" >> Ploting.txt
    echo "fit f(x) $COMILLAS$DATA$COMILLAS using 1:$COLUMN via a, b" >> Ploting.txt
    echo "plot $COMILLAS$DATA$COMILLAS using 1:$COLUMN title $COMILLAS$NAME_COLUMN$COMILLAS with lines, f(x) title $COMILLAS$FUNCTION(x)$COMILLAS with lines" >> Ploting.txt
            
 ;;
 esac

[3])

echo ""
    echo "--------------Histogram--------------"
    echo ""

    read -p "Set output: " OUTPUT
    read -p "Set title: " TITLE
    read -p "Set xlabel: " XLABEL
    read -p "Set ylabel: " YLABEL
    read -p "Set xrange structure : # [0:numeritos ]#: " XRANGE
    read -p "Set yrange structure : # [0:frecuencia ]#:: " YRANGE
    read -p "DATA FILE: " DATA
    read -p "Column: " COLUMN
    read -p "Name of the line: " NAME_COLUMN

    echo "set terminal $TYPE" > Ploting.txt
    echo "set output $COMILLAS$OUTPUT.$TYPE$COMILLAS" >> Ploting.txt
    echo "set title $COMILLAS$TITLE$COMILLAS" >> Ploting.txt
    echo "set xlabel $COMILLAS$XLABEL$COMILLAS" >> Ploting.txt
    echo "set ylabel $COMILLAS$YLABEL$COMILLAS" >> Ploting.txt
    echo "set yrange $YRANGE" >> Ploting.txt
    echo "set xrange $XRANGE" >> Ploting.txt
    
    echo "plot $COMILLAS$DATA$COMILLAS title $COMILLAS$TITLE$COMILLAS with boxes" >> Ploting.txt 


esac
;;

gnuplot -c Ploting.txt

