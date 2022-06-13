#!/bin/bash

echo "Setting Up the Mac"

#Check if Brew is installed

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

git_user(){
  local name;
  local email;
  local setusername

  echo "To Set/Not Set Git Username type true/false"
  read setusername

  if $setusername ; then
    
    echo "Setting up git Username and Email"
    echo "Enter Git UserName:";
    read name
    echo "Enter Git Email:"
    read email
    echo "Setting Username to $name and Email to $email"

    git config --global user.name "$name"
    git config --global user.email "$email"
    
  else
    echo "Not Setting Git Credentials"
  fi
}

install_apps(){
#Installing Brew packages from file
  echo "Updating existing Packages"
  brew update

  echo "Installing Brew Pacakges....."
  brew bundle install
  echo "Performing Brew Cleanup...."
  brew cleanup
  echo "All Packages Installed."

  #Installing packages from App App_Store
  echo "Using mas scripts to install app store packages"

  while read p;do
    echo "Installing $p"
    mas lucky "$p"
  done <App_Store.txt
}

#Install Custom dotfiles 

#Remaining

#Adding Symlinks
#Cloning Dotfiles repo
#Making Alias
#Changing Shell
#Adding/Cloning Dotfiles repo

















#Function Calls

#git_user
#install_apps

