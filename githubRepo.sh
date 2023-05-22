#!/bin/bash
#!/usr/bin/env sh
# prog.sh

source ./config.txt

echo "Create GitHub Repo"
read -p "Do you want to use environment variables for GitHub configuration [y/n]: " envCheck

if [[ "$envCheck" == "y" || "$envCheck" == "Y" ]]; then
    if [[  -f ./config.txt ]]; then
    ghUsername="$Github_Username"
    pat="$ghkey"
    else
    echo = "No Config file"
    exit 1
    fi
else
    read -p "Enter your GitHub username: " ghUsername
    stty -echo
    read -p "Enter your GitHub personal access token: " pat
    stty echo 
    echo ""
    read -p "Do you want to create github configuration for future use [y/n] :" configCheck
    if [[ "$configCheck" == "y" || "$configCheck" == "Y" ]]; then
        if [[ ! -f ./config.txt ]]; then
        touch ./config.txt
        echo "export Github_Username=$ghUsername" >> ./config.txt
        echo "export ghkey=$pat" >> ./config.txt
        echo "Config file created!"
        else
        echo "Config file already exist."
        fi
    fi
fi

fileAdded=false

patCheck=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $pat" https://api.github.com/user)

while ! [[ "$patCheck" -eq 200 ]]; do
    echo "Personal Access Token is invalid or unauthorized."
    read -p "Enter your GitHub personal access token: " pat
    patCheck=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $pat" https://api.github.com/user)
done

read -p "Enter a repository name: " repoName
read -p "Enter repository description: " repoDescription
read -p "Do you want the repository to be public [y/n]: " publicBool

if [[ "$publicBool" == "y" || "$publicBool" == "Y" ]]; then
    repoType="false"
elif [[ "$publicBool" == "n" || "$publicBool" == "N" ]]; then
    repoType="true"
else
    echo "Invalid Response"
    exit 1
fi

curl -u "$ghUsername:$pat" -X POST \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d '{
        "name": "'"$repoName"'",
        "description": "'"$repoDescription"'",
        "private": '$repoType'
    }'

read -p "Do you want to add a README.md to this repo [y/n]: " readmeBool
read -p "Do you want to create any file for this repo [y/n]: " fileBool

mkdir -p "$repoName"
cd "$repoName"
git init

if [[ "$readmeBool" == "y" || "$readmeBool" == "Y" || "$fileBool" == "y" || "$fileBool" == "Y" ]]; then
    fileAdded=true

    if [[ "$readmeBool" == "y" || "$readmeBool" == "Y" ]]; then
        touch README.md
        git add README.md
    fi
    while [[ "$fileBool" == "y" || "$fileBool" == "Y" ]]; do
        read -p "Enter filename: " filename
        touch "$filename"
        git add "$filename"
        read -p "Do you want to create any other file for this repo [y/n]: " fileBool
    done
fi

read -p "Do you want to add any other file to this repo [y/n]: " eFile

while [[ "$eFile" == "y" || "$eFile" == "Y" ]]; do
    fileAdded=true
    read -p "Enter file path: " filepath
    cp "$filepath" .
    echo "$filepath"
    read -p "Do you want to add any other file to this repo [y/n]: " eFile
done

if [[ "$fileAdded" == true ]]; then
    read -p "Enter the commit message: " commitMSG
    git add .
    git commit -m "$commitMSG"
    git remote add origin "https://github.com/$ghUsername/$repoName.git"
    git push -u origin master
fi

echo "Repository created successfully"