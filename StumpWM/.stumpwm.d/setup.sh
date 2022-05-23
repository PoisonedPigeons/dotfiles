#!/bin/bash
emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.stumpwm.d/init.org")'
