def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

git :init
run 'git flow init' if yes? 'Initialize with Git Flow support? [yN]'
git add: '.', commit: '-m "initial commit"'

environment <<-CODE
config.generators do |g|
    end
CODE

append_to_file '.gitignore', <<-CODE
/.sass-cache
*.*~
*.bak
.*.log
.DS_Store

# Ignore the default database
/db/*.db
/db/schema.rb

# Ignore Gemfile.lock
Gemfile.lock
CODE

after_bundle do
  log 'initialized', 'application structure'

  apply '_readme.rb'
  apply '_environment.rb'
  apply '_template-engine.rb'
  apply '_test-framework.rb'
  apply '_assets.rb'
  apply '_layout.rb'
  apply '_locale.rb'
  apply '_dry.rb'
end
