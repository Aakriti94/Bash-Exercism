#!/usr/bin/env bash

outputString=""
kiloohms=1000
megaohms=1000000
gigaohms=1000000000

shopt -s nocasematch

function resistor_color_trio() {
  case "$1" in
    black )
    retval=0
      ;;
    brown )
    retval=1
      ;;
    red )
    retval=2
      ;;
    orange )
    retval=3
      ;;
    yellow )
    retval=4
      ;;
    green )
    retval=5
      ;;
    blue )
    retval=6
      ;;
    violet )
    retval=7
      ;;
    grey )
    retval=8
      ;;
    white )
    retval=9
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

#resistor_color_trio "$3"
#outputString="${outputString}${zeros}"

resistor_color_trio "$1"
outputString=$((retval*10))

resistor_color_trio "$2"
outputString=$((outputString + retval))

resistor_color_trio "$3"
outputString="$((outputString * 10**retval))"

conversion
