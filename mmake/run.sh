#!/bin/bash

# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Details at ownyourbits.com

ARGS=$@

# also, in /etc/colorgcc/colorgccrc
# g++: /usr/lib/ccache/g++
# gcc: /usr/lib/ccache/gcc
# c++: /usr/lib/ccache/g++
# cc: /usr/lib/ccache/cc

export PATH="/usr/lib/colorgcc/:$PATH"
export CCACHE_PATH="/usr/bin"
export CCACHE_DIR=/src/.ccache
export TERM="xterm"

function timecmd()
{
  local BRWN=$'\e[0;33m'
  local YE=$'\e[1;33m'
  local NC=$'\e[0m'
  local START=$( date +%s%N )
  $@
  local END=$( date +%s%N )
  local DELTA=$( expr substr $( echo "( $END - $START )/1000000" | bc -l ) 1 8 )
  echo -e "\n${BRWN}compilation time ${YE}$DELTA ms${NC}"
}

# clear statistics
ccache -z 

# COMPILE!
NICE="nice -n19"
timecmd $NICE make $ARGS -C/src

#show ccache stats
echo
echo -e " ────────────"
echo -e " CCACHE STATS"
echo -e " ────────────"
ccache -s | sed '1,3d'

# License
#
# This script is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330,
# Boston, MA  02111-1307  USA

