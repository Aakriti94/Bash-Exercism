#!/usr/bin/env bash

function resistor_color_duo() {
  case "$1" in
    [B,b]lack )
    echo -n "0"
      ;;
    [B,b]rown )
    echo -n 1
      ;;
    [R,r]ed )
    echo -n 2
      ;;
    [O,o]range )
    echo -n 3
      ;;
    [Y,y]ellow )
    echo -n 4
      ;;
    [G,g]reen )
    echo -n 5
      ;;
    [B,b]lue )
    echo -n 6
      ;;
    [V,v]iolet )
    echo -n 7
      ;;
    [G,g]rey )
    echo -n 8
      ;;
    [W,w]hite )
    echo -n 9
      ;;
    *)
    echo "invalid color"
    exit
    ;;
  esac
}

resistor_color_duo "$1"
resistor_color_duo "$2"
echo ""
