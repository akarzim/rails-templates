gem 'responders'

run 'bundle install'
generate 'responders:install'

git add: '.', commit: '-m "Added some DRY pieces of code"'
log 'configured', 'DRY'
