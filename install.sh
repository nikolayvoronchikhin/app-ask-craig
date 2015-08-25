#!/usr/bin/env bash
set -e
set -x

pushd workflow
  # Prime database
  mongoimport \
    --db app-ask-craig \
    --collection jobs \
    --type csv \
    --headerline \
    --file ./data/craigslistJobTitles.csv

  # Build sparkling-water application
  ./gradlew build
popd

pushd web
  # Build web app
  npm install && npm run fluid
popd


