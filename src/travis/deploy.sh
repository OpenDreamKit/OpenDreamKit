#!/bin/bash

REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}

SOURCE_BRANCH="auto"
DEPLOY_BRANCH="gh-pages"

# work only on the source branch
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Refusing to work: Not on branch $SOURCE_BRANCH. "
    exit 0
fi

# work only if files actually changed. 
git diff --quiet --exit-code "HEAD" "HEAD^" src/
if [ $? -eq 0 ];then
  echo "Refusing to work: No source files were changed. Exiting normally. "
  exit 0
fi; 

# setup ssh key
echo "Setting up ssh key ..."

ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in src/travis/keys/deploy_key.enc -out src/travis/keys/deploy_key -d
chmod 600 src/travis/keys/deploy_key
eval `ssh-agent -s`
ssh-add src/travis/keys/deploy_key

echo "Done. "

echo "Cleaning previous builds ..."
make clean
echo "Done. "



# Build the bib file
echo "Updating bib file ..."
make bib
echo "Done. "

# copy it into the sub-repository
git clone $SSH_REPO deploy/bib -b $SOURCE_BRANCH
cp dist/kwarc.bib deploy/bib/dist/kwarc.bib

# cd into it and check if we have something to commit
cd deploy/bib/

git diff --exit-code
if [ $? -ne 0 ];then
  echo "Committing new KWARC.bib ..."
  git commit dist/kwarc.bib -m "Auto-generated kwarc.bib. "
  git push origin $SOURCE_BRANCH
  echo "Done. "
fi; 

cd ../../

# Install LaTeXML
echo "Installing LaTeXML prerequistes, please wait ..."
apt-get update -qq
apt-get install -qq libarchive-zip-perl libfile-which-perl libimage-size-perl libio-string-perl libjson-xs-perl libparse-recdescent-perl liburi-perl libuuid-tiny-perl libwww-perl libxml2 libxml-libxml-perl libxslt1.1 libxml-libxslt-perl texlive-latex-base imagemagick libimage-magick-perl cpanminus
echo "Done. "

echo "Installing LaTeXML, please wait ..."
cpanm LaTeXML
echo "Done. "

# Make the updated website. 
echo "Building website, this will take a while. "
make pubs

# clone the deployed repository and copy over
git clone $SSH_REPO deploy/pub -b $DEPLOY_BRANCH
cp -r dist/pubs deploy/pub

cd deploy/pub
git diff --exit-code
if [ $? -ne 0 ];then
  echo "Committing new website ..."
  git commit -A . -m "Auto-generated website. "
  git push origin $DEPLOY_BRANCH
  echo "Done. "
fi; 

cd ../..

echo "Finished build, cleaning up..."
rm -rf src/travis/deploy_key
rm -rf deploy
echo "Finished. "