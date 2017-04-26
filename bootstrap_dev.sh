#!/usr/bin/env bash

command_exists () {
    if type "$1" &> /dev/null; then
        printf "...[ok]\n";
     else
        printf "...[error]\n";
        exit 1
      fi
}

setup_virtualenv () {
    # Create virtualenv
    printf "Creating virtualenv\n";
    virtualenv -p python3.5 venv
    printf "...[ok]\n";

    . venv/bin/activate
    venv/bin/pip install -U setuptools pip wheel

    # Install requirements
    printf "Installing requirements\n";
    venv/bin/pip install -r requirements.txt
    printf "...[ok]\n";

}

# Switch working directory
cd "$(dirname ${BASH_SOURCE[0]})"

# Check required products
# Python 3.5
printf "Checking Python 3.5"
command_exists python3.5
printf "Checking virtualenv"
command_exists virtualenv

# Create virtualenv
if [ -d "venv" ]; then
    read -p "Virtualenv already exists. Do you want to delete it and recreate? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf venv
        setup_virtualenv
    fi
else
    setup_virtualenv
fi

printf "Done.\n"