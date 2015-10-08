#!/bin/bash
if [ ! -d ~/.ssh/config.d ]; then
  mkdir ~/.ssh/config.d
  cp ~/.ssh/config ~/.ssh/config.d/00_default
fi

if [ -d ~/.ssh/config.d ]; then
  cat ~/.ssh/config.d/* > ~/.ssh/config
  chown jglick:staff ~/.ssh/config
  chmod 644 ~/.ssh/config
fi
