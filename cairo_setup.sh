#!/bin/bash



#install scarb
# Check if the terminal is Bash
function setup_cairo(){
if [[ "$SHELL" =~ "bash" ]]; then

  
  
  # The terminal is Bash, so print a message to the user
  echo "The terminal is Bash."
  # set up cairo to path 
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bashrc
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bashrc
  
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bash_profile
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bash_profile


  echo " cairo is succefully configured   "  
  check_scarb 

elif  [[ "$SHELL" =~ "zsh" ]]; then

  # The terminal is not Bash, so print a message to the user
  echo "The terminal is zsh."
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.zshrc
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.zshrc
  
  echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.zsh_profile
  echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.zsh_profile
   echo " cairo is succefully configured   " 
  # check_scarb


else

  # The terminal is not Zsh, so print a message to the user
  echo "The terminal is not Zsh neither bash "

fi
# check_scarb
}


#cheking if scarb is installed 


function install_scarb(){

read -p "would you like to install scarb: ?? (  y/n ) " scarb
echo $scarb

if [[ "$scarb" = "y" || "yes" ]]; then 
  echo "installing scarb..... "
#installing scarb 
  curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh
  check_forge
else
 

 check_forge
 
fi


}



# function install_katana(){
# read -p "would you like to install katana local development node??  (y/n)  " katana
# if [[ "$katana" = "y" || "yes" ]]; then 

# #installing scarb 
#   mkdir ~/.dojo && cd ~/.dojo
#   git clone https://github.com/dojoengine/dojo
#   cd dojo
#   cargo install --path ./crates/katana --locked --force

# #check installation
#   echo Katna installed succefully 
  
# elif [[ "$katana" = "n" || "no" ]]; then 
#  check_forge

#   # install_forge
#   exit
# else 
#   exit
# fi
# # install_forge
# }

function install_forge(){
read -p "would you like to install starknet-foundry : ?? (  y/n ) " forge
echo $forge

if [[ "$forge" = "y" || "yes" ]]; then 

#installing Starknet foundry 
  curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh
  
else
 exit
fi
}

function check_forge(){
if command -v snforge >/dev/null; then

  # The command "ls" exists, so print a message to the user
  echo "starknet forge  development environment is installed "
  

else

  # The command "ls" does not exist, so print a message to the user
  echo "installing snforge... "
  install_forge


fi
echo " exiting script"
}




function check_scarb(){
  #cheking if scarb is configured
  echo "cheking scarb ..."
if ! [ -x "$(command -v "scarb --version")" ]; then
# if command -v scarb >/dev/null; then
echo "scarb installed and configured";
  check_katana
  

else

  
  echo "scarb tool not installed "
  install_scarb
  # check_katana
  
  

fi

}

# function check_katana(){
# if command -v katana >/dev/null; then

#   # The command "ls" exists, so print a message to the user
#   echo "Katana local development  is installed "
#   check_forge
  

# else

#   # The command "ls" does not exist, so print a message to the user
#   echo "installing katana... "
#   install_katana


# fi
# }


# Check if cairo is installed
function check_cairo(){
if ! [ -x "$(command -v "cairo-run --version")" ]; then

  # cairo is not installed, proceed with install
  echo "Cairo is already installed!"
  check_scarb
  check_forge
  exit
  
else
    # rustup override set stable && rustup update
  rustup override set stable && rustup update
  curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash
  echo "configuring cairo"
  setup_cairo

  


fi
# check_scarb
}

#checks 
function check_rust_installation(){
#check rust installation
if ! [ -x "$(command -v rustc)" ]; then

  # Rust is not installed, proceed with install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  exit
  
else
  echo "Rust is already installed!"
  check_cairo
  exit

  # rustup override set stable && rustup update
fi
# check_cairo
}
# install cairo 
# curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash



check_forge
check_rust_installation
