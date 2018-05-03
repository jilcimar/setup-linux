#Git
sudo apt-get install git
git config --global user.name "jilcimar"
git config --global user.email "jilcimar.fernandes0267@gmail.com"

#Instalação do Laravel + PHP
sudo apt-add-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php-mbstring
sudo apt-get install composer -y
sudo apt-get install php7.2-pgsql -y
sudo apt-get install apache2 libapache2-mod-php7.0 -y
sudo apt-get install php7.2-dev -y
sudo apt-get install php7.2-zip -y
sudo apt-get install php7.2-xml -y
sudo apt-get install php7.2-mbstring -y
sudo apt-get install php7.2-cgi -y
sudo apt-get install php7.2-curl -y
sudo apt-get install php7.2-zip

composer global require "laravel/installer"
export PATH=$PATH:$HOME/.config/composer/vendor/bin

#PostgreSQL
sudo apt-get install postgresql pgadmin3

#VIM
sudo apt-get install vim

#NPM
sudo apt install npm

#Setup Python3 + Pip3
sudo apt install python3-pip
sudo apt install python3-pip
pip install --upgrade pip
sudo apt update
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt update
sudo apt-get install python3.6

# Heroku

sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"

curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -

sudo apt-get update

sudo apt-get install heroku


#SPOTFY
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
