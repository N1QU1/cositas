#!/usr/bin/bash

#Ploting with gnuplot

echo ""
echo "--------------Comparison of a function with a column--------------"
echo ""

read -p "Set terminal: " TYPE
read -p "Set output: " OUTPUT
read -p "Set title: " TITLE
read -p "Set xlabel: " XLABEL
read -p "Set ylabel: " YLABEL
read -p "Function: " FUNCTION
read -p "DATA FILE: " DATA
read -p "Column: " COLUMN
read -p "Name of the column: " NAME_COLUMN

echo ""
echo "Terminal set to: $TYPE"
echo "Output set to: $OUTPUT.$TYPE"
echo "Title set to: $TITLE"
echo "xlabel set to: $XLABEL"
echo "ylabel set to: $YLABEL"
echo "Function set to: $FUNCTION"
echo "Reading from the file: $DATA"
echo "Number of the column: $COLUMN"
echo "Name of the column" $NAME_COLUMN
echo ""

read -p "Want to continue? (Y/N)" ANSWER

case "$ANSWER" in
 [yY] | [yY][eE][sS])
    echo "Ploting..."
    gnuplot -persist << LALALA
        set terminal "$TYPE"
        set output "$OUTPUT.$TYPE"
        set title "$TITLE"
        set xlabel "$XLABEL"
        set ylabel "$YLABEL"
        f(x)=a*$FUNCTION(x)+b
        fit f(x) "$DATA" using 1:$COLUMN via a, b
        plot "$DATA" using 1:$COLUMN title "$NAME_COLUMN" with lines, f(x) title "$FUNCTION(x)" with lines
LALALA

    ;;
 [nN] | [nN][oO])
    ;;
 *)
 echo "Please type something that makes sense."
 ;;
esac






