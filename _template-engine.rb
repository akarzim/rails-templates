gem 'slim-rails'

insert_into_file 'config/application.rb', "      g.template_engine :slim\n", after: "config.generators do |g|\n"

git add: '.', commit: '-m "Added Slim template engine"'
log 'configured', 'Slim template engine'
