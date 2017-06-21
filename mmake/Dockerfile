# Make wrapper with GCC 6, colorgcc and ccache
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
#
#   It is recommended to use this alias
#
#     alias mmake='docker run --rm -v "$(pwd):/src" -t ownyourbits/mmake'
#
#   Then, use it just as you would use 'make'
#
# Note: a '.ccache' directory will be generated in the directory of execution
#
# Note: you can leave the container running for faster execution. Use these aliases
#
#     alias runmake='docker run --rm -d -v "$(pwd):/src" --entrypoint /bg.sh -t --name mmake ownyourbits/mmake'
#     alias mmake='docker exec -t mmake /run.sh'
#
# Details at ownyourbits.com

FROM ownyourbits/minidebian

LABEL description="Make wrapper with GCC 6, colorgcc and ccache"
MAINTAINER Ignacio Núñez Hernanz <nacho@ownyourbits.com>

# Install toolchain 
RUN   apt-get update;\
      DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gcc make libc6-dev;\
      DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ccache colorgcc; \
      dpkg -L binutils | grep -v  "^/usr/bin\|^/usr/lib" | while read f; do test -f $f && rm $f; done; \
      dpkg -L gcc-6    | grep -v  "^/usr/bin\|^/usr/lib" | while read f; do test -f $f && rm $f; done; \
      apt-get autoremove -y; apt-get clean; rm /var/lib/apt/lists/* -r; rm -rf /usr/share/man/*

# bc to print compilation time
RUN sudo apt-get update; \
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends bc; \
    sudo apt-get autoremove -y; sudo apt-get clean; sudo rm /var/lib/apt/lists/* -r; sudo rm -rf /usr/share/man/*

# Set colorgcc and ccache
COPY colorgccrc /etc/colorgcc/colorgccrc

RUN mkdir  /usr/lib/colorgcc; \
    ln -s /usr/bin/colorgcc /usr/lib/colorgcc/c++; \
    ln -s /usr/bin/colorgcc /usr/lib/colorgcc/cc ; \
    ln -s /usr/bin/colorgcc /usr/lib/colorgcc/gcc; \
    ln -s /usr/bin/colorgcc /usr/lib/colorgcc/g++; 

# Builder user
RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends adduser; \
    adduser builder --disabled-password --gecos ""; \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; \
    sed -i "s|^#force_color_prompt=.*|force_color_prompt=yes|" /home/builder/.bashrc; \
    apt-get purge -y adduser passwd; \
    apt-get autoremove -y; apt-get clean; rm /var/lib/apt/lists/* -r; rm -rf /usr/share/man/*

RUN echo 'export PATH="/usr/lib/colorgcc/:$PATH"' >> /home/builder/.bashrc; \
    echo 'export CCACHE_DIR=/src/.ccache'         >> /home/builder/.bashrc; \
    echo 'export TERM="xterm"'                    >> /home/builder/.bashrc; 

USER builder

# Run
ENTRYPOINT ["/run.sh"]

COPY bg.sh run.sh /

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

