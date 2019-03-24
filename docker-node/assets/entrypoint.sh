#!/bin/sh

set -e

echo "hello world from script file"

npm install

npm start

exec "$@"