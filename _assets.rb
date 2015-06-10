inside 'app/assets/stylesheets/' do
  run 'mv -f application.css application.scss'
  gsub_file 'application.scss', '*= require', '* require'
end

environment "config.assets.enabled = true"
environment "config.assets.paths << Rails.root.join('/app/assets/fonts')"

bourbon = yes? 'Initialize with Bourbon CSS framework? [yN]'

if bourbon
  gem 'bourbon'
  gem 'neat'
  gem 'refills'

  run 'bundle update sass'

  inside 'app/assets/stylesheets/' do
    append_to_file 'application.scss', <<-CODE
    @import "normalize";
    @import "bourbon";
    @import "neat";
    CODE
  end
end

font_awesome = yes? 'Initialize with FontAwesome support? [yN]'

if font_awesome
  gem 'font-awesome-rails'

  inside 'app/assets/stylesheets/' do
    append_to_file 'application.scss', <<-CODE
    @import "font-awesome";
    CODE
  end
end


if bourbon
  copy_file 'app/assets/stylesheets/_fonts.scss'
  copy_file 'app/assets/stylesheets/_variables.scss'
  copy_file 'app/assets/stylesheets/_typography.scss'
  copy_file 'app/assets/stylesheets/_forms.scss'
  copy_file 'app/assets/stylesheets/_header.scss'
  copy_file 'app/assets/stylesheets/_footer.scss'
  copy_file 'app/assets/stylesheets/_flashes.scss'

  inside 'app/assets/stylesheets/' do
    append_to_file 'application.scss', <<-CODE
    @import "fonts";
    @import "variables";
    @import "typography";
    @import "forms";
    @import "header";
    @import "footer";
    @import "flashes";
    CODE
  end
end

run 'bundle install' if bourbon || font_awesome

git add: '.', commit: '-m "Added assets configuration"'
log 'configured', 'assets'
