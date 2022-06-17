#!/usr/bin/env bash

set -e

cd CodeSignal || exit

git commit -m 'Chunk commit' ||

chunks=( $(git add -n --all) )

i=0
for chunk in "${chunks[@]}"
do
  ((i=i+1))
  if [ $((i%2)) -eq 0 ]
  then
    git add "${chunk:1:${#chunk}-2}"
  fi
  if [ $((i%100)) -eq 0 ]
  then
    git commit -m 'Chunk commit'
  fi
done

git commit -m 'Chunk commit'
