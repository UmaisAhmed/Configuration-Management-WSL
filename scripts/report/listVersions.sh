#!/bin/bash

. ~/.local/bin/env/configureJvmEnv.sh
. ~/.local/bin/env/configureN.sh
. ~/.cargo/env
. ~/.local/bin/env/configureDeno.sh

echo -e "\n\nListing software versions:"

echo -e "\ndocker:"
docker --version
docker --help | grep compose

