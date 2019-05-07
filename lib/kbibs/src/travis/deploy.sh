#!/bin/bash

REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=$(git rev-parse --short HEAD)

SOURCE_BRANCH="master"
DEPLOY_BRANCH="gh-pages"

# work only on the source branch
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Refusing to work: Not on branch $SOURCE_BRANCH. "
    exit 0
fi

# work only if files actually changed.
git diff --quiet --exit-code "HEAD" "HEAD^" src/ Makefile preamble.bib kwarcpubs.bib extpubs.bib kwarccrossrefs.bib extcrossrefs.bib
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

echo "Configuring Git ..."
git config --global user.email "${COMMIT_AUTHOR_EMAIL}"
git config --global user.name "KWARC Bot"
echo "Done. "

echo "Cleaning previous builds ..."
make clean
if [ "$?" -ne "0" ]; then
  echo "Fail"
  exit 1
fi
echo "Done. "

# Build the bib file
echo "Updating kwarc.bib ..."
make bib
if [ "$?" -ne "0" ]; then
  echo "Fail"
  exit 1
fi
echo "Done. "

# copy it into the sub-repository
echo "Preparing kwarc.bib deploy ..."
git clone $SSH_REPO deploy/bib -b $SOURCE_BRANCH --depth 1
cp -v kwarc.bib deploy/bib/kwarc.bib
echo "Done. "

# Add all the new files
cd deploy/bib
git add --all
git status

# Commit and push
echo "Committing new kwarc.bib ..."
git commit -m "Auto-generated kwarc.bib for commit $SHA"
git push origin $SOURCE_BRANCH
echo "Done. "

# go back
cd ../../

# Install cpanm, xsltproc + latexml deps
echo "Installing build prerequistes, please wait ..."
sudo apt-get update -qq
sudo apt-get install -qq cpanminus xsltproc
sudo apt-get install   \
  libarchive-zip-perl libfile-which-perl libimage-size-perl  \
  libio-string-perl libjson-xs-perl libtext-unidecode-perl \
  libparse-recdescent-perl liburi-perl libuuid-tiny-perl libwww-perl \
  libxml2 libxml-libxml-perl libxslt1.1 libxml-libxslt-perl  \
  texlive-latex-base imagemagick libimage-magick-perl
echo "Done. "

# Intalls latexml
echo "Installing LaTeXML, please wait ..."
cpanm --notest --sudo LaTeXML
if [ "$?" -ne "0" ]; then
  echo "Fail"
  exit 1
fi
echo "Done. "

# Make the updated website.
echo "Building website and xml, this will take a while. "
make xml pubs
if [ "$?" -ne "0" ]; then
  echo "Fail"
  exit 1
fi
echo "Done. "

# get ready to deploy
echo "Preparing website and xml deploy ..."
git clone $SSH_REPO deploy/pub -b $DEPLOY_BRANCH  --depth 1
cp -rv dist/pubs/* deploy/pub
mkdir -p deploy/pub/xml
cp -v dist/ltxml/*.xml deploy/pub/xml
echo "Done. "

# Add all the new files
cd deploy/pub
git add --all
git status

# commit and push
echo "Committing new website and new xml ..."
git commit -m "Auto-generated website for commit $SHA"
git push origin $DEPLOY_BRANCH
echo "Done. "

# go back
cd ../..

# cleanup sensitive files
echo "Finished build, cleaning up..."
rm -rf src/travis/deploy_key
rm -rf deploy
echo "Done. "
