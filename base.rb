def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

git :init
run 'git flow init' if yes? 'Initialize with Git Flow support?'
git add: '.', commit: '-m "initial commit"'

environment <<-CODE
config.generators do |g|
    end
CODE

file '.gitignore', <<-CODE
# Ignore bundler config.
/.bundle

# Ignore all logfiles and tempfiles.
/log/*
!/log/.keep
/.sass-cache
/tmp
*.*~
*.bak
.*.log
.DS_Store

# Ignore the default SQLite database.
/db/*.db
/db/*.sqlite3
/db/*.sqlite3-journal
/db/schema.rb

# Ignore application configuration
/config/application.yml

# Ignore Gemfile.lock
Gemfile.lock
CODE

after_bundle do
  log 'initialized', 'application structure'

  apply '_environment.rb'
  apply '_template-engine.rb'
  apply '_test-framework.rb'
  apply '_locale.rb'
  apply '_assets.rb'
end
