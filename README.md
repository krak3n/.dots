# Dot Files

Clone into `~/.dots`. Run `make` all to set up all the symbolic links.


## Vim Configure

```
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --with-x \
            --enable-gui=auto \
            --enable-gtk2-check \
            --enable-gnome-check \
            --with-tlib=ncurses \
            --with-compiledby="Chris Reeves <hello@chris.reeves.io>" \
            --prefix=/usr/local
```
