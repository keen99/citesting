#!/bin/bash

##
##  boilerplate code for getting this installed and updated.
##



##don't use a shared toolkit for jenkins - could cause race issues with multiple projects..
if [[ "x$JENKINS_HOME" == "x" ]]
 then
  #if we're not jenkins, just use $HOME
  TOOLDIR=${TOOLDIR:=$HOME/.bt}
else
  #if we're jenkins, put it in $PWD instead.
  TOOLDIR=${TOOLDIR:=$PWD/.bt}
fi

BTREPO="git@gitlab.com:hypops/buildtools.git"

if ! [[ -d "$TOOLDIR" ]]
 then
  #doesnt exist, clone it.
  echo "Creating $TOOLDIR"
  git clone "$BTREPO" "$TOOLDIR" > /dev/null
  if [ "$1" != "" ]; then
    cd "$TOOLDIR"
    git checkout $1 > /dev/null
    cd "$OLDPWD"
  fi
else
  #exists, update it.
  echo "Updating $TOOLDIR"
  cd "$TOOLDIR"
  if [ "$1" != "" ]; then
    git checkout $1 > /dev/null
  fi
  git pull > /dev/null
  cd "$OLDPWD"
fi

## update your path...

source "${TOOLDIR}/source-tools.sh"
