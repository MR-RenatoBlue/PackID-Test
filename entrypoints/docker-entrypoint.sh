#!/bin/sh

set -e

# if [ -f tmp/pids/server.pid ]; then
#   rm -f tmp/pids/server.pid
# fi

# bundle exec rails s -b 0.0.0.0

echo 'Starting webpack dev server ...' && bin/webpack-dev-server &
echo 'starting Rails server ...' && rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0
# sleep 5 &
# echo 'Setting up data base and running migrations ...' && bundle exec rails db:setup db:migrate
