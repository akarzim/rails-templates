gem 'font-awesome-rails'

environment "config.assets.enabled = true"
environment "config.assets.paths << Rails.root.join('/app/assets/fonts')"

inside 'app/assets/stylesheets/' do
  gsub_file 'application.css', '*= require', '* require'
  append_to_file 'application.css', "@import 'fontawesome'"
end


git add: '.', commit: '-m "Added assets configuration"'
log 'configured', 'assets'
