#!/bin/bash

git checkout --orphan gh-pages
git rm -r --cached .
find . -name "*.cfg" -exec landslide {} \;
git add -f *.html
git commit -m "Deploy"
git push deploy gh-pages -f
git clean -fd
git checkout master
git branch -D gh-pages
