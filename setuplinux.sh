#!/bin/bash

# Remove warning of the Gtk-Message
function zenity() {
    /usr/bin/zenity "$@" 2>/dev/null
}

# Cores
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

# Função main
function Main() {
  options=$( \
    zenity --list --text "Quais programas deseja instalar?" --checklist \
    --column "select" --column "options" \
    FALSE "Git" \
    FALSE "PHP + Laravel" \
    FALSE "Node.js" \
    FALSE "Lumen" \
    FALSE "PostgreSQL" \
    FALSE "VIM" \
    FALSE "NPM" \
    FALSE "Python3 + Pip3" \
    FALSE "phpMyAdmin" \
    FALSE "Heroku" \
    FALSE "Chromium" \
    FALSE "Spotify" \
  );

  # Chama as funções correspondente ao que foi escolhido
  IFS="|"
  for opt in $options; do
    case $opt in
      "PHP + Laravel") PhpLaravel $opt ;;
      "Node.js") NodeJs $opt ;;
      "PostgreSQL") PostgreSql $opt ;;
      "VIM") Vim $opt ;;
      "NPM") Npm $opt ;;
      "Python3 + Pip3") PythonPip $opt ;;
      "phpMyAdmin") PhpMyAdmin $opt ;;
      *) $opt $opt ;;
    esac
  done
  IFS=""
}

# Função para imprimir o inicio e fim de uma instalação
function printTerminal() {
  case $1 in
    "start") printf "${RED}Instalando o $2${NC}\n" ;;
    "finish") printf "${GREEN}Instalação do $2 finalizada ${NC}\n" ;;
  esac
}

# Git
function Git() {
  printTerminal start $1
  # sudo apt-get install git
  # git config --global user.name "jilcimar"
  # git config --global user.email "jilcimar.fernandes0267@gmail.com"
  printTerminal finish $1
}

# PHP + Laravel
function PhpLaravel() {
  printTerminal start $1
  sudo apt-add-repository ppa:ondrej/php
  sudo apt-get update
  sudo apt-get install php-mbstring
  sudo apt-get install composer -y
  sudo apt-get install php7.2-pgsql -y
  sudo apt-get install apache2 libapache2-mod-php7.2 -y
  sudo apt-get install php7.2-dev -y
  sudo apt-get install php7.2-zip -y
  sudo apt-get install php7.2-xml -y
  sudo apt-get install php7.2-mbstring -y
  sudo apt-get install php7.2-cgi -y
  sudo apt-get install php7.2-curl -y
  sudo apt-get install php7.2-zip

  composer global require "laravel/installer"
  export PATH=$PATH:$HOME/.config/composer/vendor/bin
  printTerminal finish $1
}

# Node.js
function NodeJs() {
  printTerminal start $1
  sudo apt update
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y nodejs
  printTerminal finish $1
}

# Lumen
function Lumen() {
  printTerminal start $1
  composer global require "laravel/lumen-installer"
  printTerminal finish $1
}

# PostgreSQL
function PostgreSql() {
  printTerminal start $1
  sudo apt-get update
  sudo apt-get install postgresql pgadmin3
  printTerminal finish $1
}

# VIM
function Vim() {
  printTerminal start $1
  sudo apt-get update
  sudo apt-get install vim
  printTerminal finish $1
}

# NPM
function Npm() {
  printTerminal start $1
  sudo apt-get update
  sudo apt install npm
  printTerminal finish $1
}

# Setup Python3 + Pip3
function PythonPip() {
  printTerminal start $1
  sudo apt-get update
  sudo apt install python3-pip
  sudo apt install python3-pip
  pip install --upgrade pip
  sudo apt update
  sudo add-apt-repository ppa:jonathonf/python-3.6
  sudo apt update
  sudo apt-get install python3.6
  printTerminal finish $1
}

# phpMyAdmin
function PhpMyAdmin() {
  printTerminal start $1
  sudo apt-get update
  sudo apt-get install phpmyadmin php-mbstring php-gettext
  sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
  sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
  sudo service apache2 restart
  printTerminal finish $1
}

# Heroku
function Heroku() {
  printTerminal start $1
  sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
  curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install heroku
  printTerminal finish $1
}

# Chromium
function Chromium() {
  printTerminal start $1
  sudo apt-get update
  sudo apt-get install chromium-browser
  printTerminal finish $1
}

# Spotify
function Spotify() {
  printTerminal start $1
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update
  sudo apt-get install spotify-client
  printTerminal finish $1
}

# Chama a função inicial do programa
Main