#!/bin/bash --login

#Author: Rennan Felipe
#Email: rennan.chaves95@gmail.com
#Version: 1.5.2
#Licence: MIT 
#Description: Scrip file to automate the Rails environment
#Fonts: Code based on the follow article: https://gorails.com/setup/ubuntu/18.10#final-steps

if [ "$USER" = 'root' ]
then
    echo ""
    echo "Only set sudo when asked!"
    echo ""
    exit 9
fi

history -c

echo "Update the enviroment"
sudo apt-get update -y
sudo apt-get install dialog -y

echo "Install Node.js and Yarn"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update -y
sudo apt-get install gcc g++ make git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs yarn dirmngr -y

echo "Configure git"
user=$(dialog --title "GIT CONFIGURATION" --inputbox "Put your git username and press enter:" 10 30 --output-fd 1)
email=$(dialog --title "GIT CONFIGURATION" --inputbox "Put your git email and press enter:" 10 30 --output-fd 1)

git config --global color.ui true
git config --global user.name $user
git config --global user.email $email
ssh-keygen -t rsa -b 4096 -C $email

echo "Install MySQL"
sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y
mysql_secure_installation

echo "Install Ruby and dependencies"
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev -y
sudo apt-get install software-properties-common -y
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

echo "Add user to 'rvm' group"
sudo usermod -a -G rvm $(whoami)


echo "rvm install 2.7.0"
rvm install 2.7.0
rvm docs generate-ri

echo "rvm use 2.7.0 --default"
rvm use 2.7.0 --default
ruby -v

echo "Install Bundler"
gem install bundler

echo "Install Rails!"
gem install rails -v 6.0.2.1
rails -v

echo "Done!"
echo "Enjoy your new environment!" 

dt=$(date +"%Y%m%d%H%M%S")
