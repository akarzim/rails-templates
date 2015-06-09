if yes? 'Initialize with Rspec support?'
  gem_group :development, :test do
   gem 'rspec-rails'
  end

  run 'bundle install'

  generate 'rspec:install'

  insert_into_file 'config/application.rb', "      g.test_framework :rspec, fixture: false\n", after: "config.generators do |g|\n"

  git rm: '-r test'
  git add: '.', commit: '-m "Added Rspec test framework"'
  log 'configured', 'Rspec test framework'
end
