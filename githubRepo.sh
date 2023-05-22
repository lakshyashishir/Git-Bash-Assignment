#!/bin/bash

echo "Create GitHub Repo"

read -p "Enter your GitHub username: " ghUsername
read -p "Enter your GitHub personal access token: " pat
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

read -p "Do you want to add a README.md in this repo [y/n]: " readmeBool

read -p "Commit message: " commitMSG

mkdir -p "$repoName"
cd "$repoName"
git init

if [[ "$readmeBool" == "y" || "$readmeBool" == "Y" ]]; then
    touch README.md
    git add README.md
fi

read -p "Do you want to add a any other file in this repo [y/n]: " fileBool
if [[ "$fileBool" == "y" || "$fileBool" == "Y" ]]; then
    read -p "Enter filename : " filename
    touch $filename
    nano $filename
    git add $file
fi

git commit -m "$commitMSG"
git remote add origin "https://github.com/$ghUsername/$repoName.git"
git push -u origin master