#!/usr/bin/env bash

outputString=""
kiloohms=1000
megaohms=1000000
gigaohms=1000000000

function resistor_color_trio() {
  case "$1" in
    [B,b]lack )
    retval=0
    zeros=""
      ;;
    [B,b]rown )
    retval=1
    zeros=0
      ;;
    [R,r]ed )
    retval=2
    zeros=00
      ;;
    [O,o]range )
    retval=3
    zeros=000
      ;;
    [Y,y]ellow )
    retval=4
    zeros=0000
      ;;
    [G,g]reen )
    retval=5
    zeros=00000
      ;;
    [B,b]lue )
    retval=6
    zeros=000000
      ;;
    [V,v]iolet )
    retval=7
    zeros=0000000
      ;;
    [G,g]rey )
    retval=8
    zeros=00000000
      ;;
    [W,w]hite )
    retval=9
    zeros=000000000
      ;;
    *)
    echo "invalid color"
    exit
    ;;
  esac
}

function conversion() {
  divide_gigaohms=$(( outputString / gigaohms ))
  divide_megaohms=$(( outputString / megaohms ))
  divide_kiloohms=$(( outputString / kiloohms ))

  modulus_gigaohms=$(( outputString % gigaohms ))
  modulus_megaohms=$(( outputString % megaohms ))
  modulus_kiloohms=$(( outputString % kiloohms ))

  if [ $divide_gigaohms -ne 0 ] && [ $modulus_gigaohms -eq 0 ]; then
    echo "${divide_gigaohms} gigaohms"
  elif [ $divide_megaohms -ne 0 ] && [ $modulus_megaohms -eq 0 ]; then
    echo "${divide_megaohms} megaohms"
  elif [ $divide_kiloohms -ne 0 ] && [ $modulus_kiloohms -eq 0 ]; then
    echo "${divide_kiloohms} kiloohms"
  else
    echo "${outputString} ohms"
  fi
}

#resistor_color_trio "$1"
#outputString=${retval}

#resistor_color_trio "$2"
#outputString="${outputString}${retval}"

resistor_color_trio "$1"
outputString=$((retval*10))

resistor_color_trio "$2"
outputString=$((outputString + retval))

resistor_color_trio "$3"
outputString="${outputString}${zeros}"

conversion
