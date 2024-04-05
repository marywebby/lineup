#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# For Ruby on Rails apps uncomment these lines to precompile assets and migrate your database.
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake slurp:type_of_products
bundle exec rake slurp:products
bundle exec rake slurp:ingredients
bundle exec rake slurp:sample_data
