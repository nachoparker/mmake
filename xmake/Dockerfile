# Make wrapper with GCC 6, colorgcc and ccache for crosscompilation
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
#
#   It is recommended to use this alias
#
#     alias xmake='docker run --rm -v "$(pwd):/src" -v "/toolchain/path:/toolchain" -t ownyourbits/xmake'
#
#   Then, use it just as you would use 'make'
#
# Note: a '.ccache' directory will be generated in the directory of execution
#
# Note: you can leave the container running for faster execution. Use these aliases
#
#     alias runmmake='docker run --rm -d -v "$(pwd):/src" --name mmake -t ownyourbits/xmake /bg'
#     alias xmake='docker exec -t mmake /run.sh'
#
# Details at ownyourbits.com

FROM ownyourbits/mmake

LABEL description="Make wrapper for crosscompilation, colorgcc and ccache"
MAINTAINER Ignacio Núñez Hernanz <nacho@ownyourbits.com>

COPY run.sh /

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


