#!/bin/bash
# Check if Rust is installed
if ! [ -x "$(command -v rustc)" ]; then

  # Rust is not installed, proceed with install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  
  # Rest of install script...
  
else
  echo "Rust is already installed!"
fi


#update rust code 
# Install stable Rust
rustup override set stable && rustup update

# install cairo 
curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash

# touch bashrc for runner 
# touch .bashrc
# touch .bash_profile

# set up cairo to path 
echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bashrc
echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bashrc

echo 'export CAIRO_ROOT="$HOME/.cairo"' >> ~/.bash_profile
echo 'command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"' >> ~/.bash_profile

#install scarb
curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh
#verify installation
scarb --version



echo " cairo is succefully "  installed 

curl https://get.starkli.sh | sh
export PATH="/home/gitpod/.starkli/bin:$PATH"
starkliup
starkli --version
