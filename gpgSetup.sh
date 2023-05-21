#!/bin/bash


    if ! [ `which gpg` ]; then
        echo "Error: gpg is not installed." 
        exit 1
    fi


function check_gpg_key {
    if [ -z "$(gpg --list-secret-keys --keyid-format=long)" ]; then
        echo "Error: No gpg key found." 
        exit 1
    fi
}

function signingkey {
    gppsigningkey=$(git config --global user.signingkey)
}

function configure_git {
    git config --global user.signingkey "$1"
    git config --global commit.gpgsign true
}

echo "Welcome to gpg setup"
input=4

while [ $input -ne 0 ]; do
    echo "Enter 1 to generate a new key, 2 to use existing keys, 3 to delete a key, 0 to exit"
    read -r input

    if [ $input -eq 1 ]; then
        gpg --full-generate-key
        key=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/ {print $2}')
        newKey= "-n $key | tail -c 16"
        configure_git "$new_key"
        gpg --armor --export "$new_key" | cat
        echo "Use this key in github gpg section to sign future commits"

    elif [ $input -eq 2 ]; then
        gpg --list-secret-keys --keyid-format=long
        echo "Enter the uid of the key you want to use"
        read -r keyID
        configure_git "$keyID"
        gpg --armor --export "$KeyID" | cat
        echo "Use this key in github gpg section to sign future commits"

    elif [ $input -eq 3 ]; then
        gpg --list-secret-keys --keyid-format=long
        echo "Enter the mail id of the key you want to delete"
        read -r KeyID
        gpg --delete-secret-key "$KeyID"
        gpg --delete-key "$KeyID"

    elif [ $input -eq 0 ]; then
        echo "Exiting"

    else
        echo "Invalid input"
    fi
done
