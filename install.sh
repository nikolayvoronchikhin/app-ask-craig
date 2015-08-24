#!/usr/bin/env bash
set -e
set -x

pushd workflow
  ./gradlew build
popd

pushd web
  # Build web app
  npm install

  # Compile user interface
  ./node_modules/.bin/fluid \
    --compile app.coffee \
    --include-js lib/thrift/lib/js/src/thrift.js \
    --include-js gen-js/Web.js \
    --include-js gen-js/web_types.js
popd


# TODO pass port
# cd workflow
# ./gradlew run

# cd web
# npm start -- --workflow-server=localhost:9090
