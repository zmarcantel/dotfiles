#!/bin/bash

if [[ -d ~/coffee ]]; then
    ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ \
        -f ~/.vim/tags/coffee \
        ~/coffee/src

    ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ \
        -f ~/.vim/tags/coffee \
        -a \
        ~/coffee/src \
        ~/coffee/testlib
fi
