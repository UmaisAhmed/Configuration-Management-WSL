#!/bin/bash

set -euo pipefail

DIR_ME=$(realpath $(dirname $0))
. ${DIR_ME}/.installUtils.sh
setUserName "$(whoami)"

bash ${DIR_ME}/../config/system/prepareXServer.sh ${USERNAME}

echo -e "\n\nInstalling Base Packages apt"
bash ${DIR_ME}/installBasePackages.sh

echo -e "\n\nInstalling docker & docker-compose apt"
bash ${DIR_ME}/installDocker.sh

# clean-up
sudo apt autoremove

bash ${DIR_ME}/../report/listVersions.sh
