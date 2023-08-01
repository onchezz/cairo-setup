#!/bin/bash
mkdir ~/.dojo && cd ~/.dojo
git clone https://github.com/dojoengine/dojo
cd dojo
cargo install --path ./crates/katana --locked --force

#check installation
katana --version
pip install starknet-devnet
curl -L https://raw.githubusercontent.com/software-mansion/protostar/master/install.sh | bash

# #[contract]
# mod HelloStarknet {
#     struct Storage {
#         balance: felt252,
#     }

#     // Increases the balance by the given amount.
#     #[external]
#     fn increase_balance(amount: felt252) {
#         assert(amount != 0, 'Amount cannot be 0');
#         balance::write(balance::read() + amount);
#     }

#     // Returns the current balance.
#     #[view]
#     fn get_balance() -> felt252 {
#         balance::read()
#     }
# }
