dotfiles
========

This is my collection of dotfiles.

They can individually be installed using `stow` (instructions below).

Dot Packages
============

1. env
    * General enviroment: aliases, exports, variables, etc
2. i3
    * Config for the `i3` tiling window manager
3. vim
    * Configuration for the `vim` text editor
4. zsh
    * Configuration for the `zsh` shell


Stow
====

[GNU Stow](https://www.gnu.org/software/stow/) is a tool used to manage the dot files as individual packages. It's handy
for pretty much all config management.

#### Install on Linux

````bash
## Using aptitude
sudo apt-get install stow

## using pacman
sudo pacman -Syu stow

## others are similar
````

#### Install on MacOSX

````bash
sudo brew install stow
````


Installing Dot-File Packages
============================

See the above list of available dot-packages.

Once in the directory of this repository (after cloning):

````bash
stow {package}
````

This symlinks the files into their correct place. Any changes to the files will change the files in this repo.

When changes are made, simply commit the changes.
