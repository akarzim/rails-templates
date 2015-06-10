gem 'figaro'

run 'bundle install'

run 'figaro install'

git add: '.', commit: '-m "Added Figaro ENV configuration support"'
log 'configured', 'Figaro ENV support'
