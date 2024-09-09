#!/bin/bash

d0=$(realpath $(dirname $0))

function mklink () {
	local target=${2:-$HOME}/$1
	mkdir -p $(dirname $target)
	ln -vf "$d0/$1" "${2:-$HOME}/$1"
}

mklink .vimrc.shared
mklink .vimrc.base
mklink .vimrc
mklink .nvimrc
mklink .ideavimrc
mklink init.vim $HOME/.config/nvim
mklink vim_bash

