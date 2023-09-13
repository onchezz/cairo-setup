#!/bin/bash

# Check if Rust is installed
if ! [ -x "$(command -v rustc)" ]; then

  # Rust is not installed, proceed with install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  
  
else
  echo "Rust is already installed!"

  rustup override set stable && rustup update
fi

# Check if cairo is installed
if ! [ -x "$(command -v cairo-run)" ]; then

  # cairo is not installed, proceed with install
 curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash
  
  
else
  echo "Cairo is already installed!"

  rustup override set stable && rustup update
fi
# install cairo 
# curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash



#install scarb
# Check if the terminal is Bash
if [[ "$SHELL" =~ "bash" ]]; then

  
  
  # The terminal is Bash, so print a message to the user
  echo "The terminal is Bash."
  # set up cairo to path 
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bashrc
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bashrc
  
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bash_profile
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bash_profile


  echo " cairo is succefully and set up  "  installed 

elif  [[ "$SHELL" =~ "zsh" ]]; then

  # The terminal is not Bash, so print a message to the user
  echo "The terminal is zsh."
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.zshrc
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.zshrc
  
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.zsh_profile
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.zsh_profile
  check_scarb


else

  # The terminal is not Zsh, so print a message to the user
  echo "The terminal is not Zsh neither bash "

fi

if command -v scarb >/dev/null; then

  # The command "scarb " exists, scarb is intalled
  echo "scarb tool is already installed "
  

else

  # The command "ls" does not exist, so print a message to the user
  echo "installing scarb ";
read -p "would you like to install scarb: ?? (  y/n ) " scarb
echo $scarb

if [[ "$scarb" = "y" || "yes" ]]; then 

#installing scarb 
  curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh
  

fi
#install forge 
read -p "would you like to install starknet-foundry : ?? (  y/n ) " forge
echo $forge

if [[ "$forge" = "y" || "yes" ]]; then 

#installing Starknet foundry 
  curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh
  
  
fi

