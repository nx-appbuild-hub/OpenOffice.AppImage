/#!/usr/bin/env bash

for entry in "$1"/*
do
  echo "$entry"
  dpkg -x $entry build
done
