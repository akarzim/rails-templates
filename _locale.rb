locales = (ENV['LOCALES'] || ask('Which locales do you want to use (separate with commas if more)? [en]')).split(/[,\s]+/)
locales = [locales].flatten(1).compact

insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
  <<-CODE
  scope "(:locale), locale: /#{locales.join('|')}/ do
  end
  CODE
end

locales.each do |locale|
  append_to_file 'app/views/layouts/_header.slim', <<-CODE
      = link_to('#{locale.upcase}', params.merge(locale: :#{locale.downcase}), class: 'locale')
  CODE

  locale += '.yml' unless locale =~ /\.(yml|rb)$/
  get "https://github.com/svenfuchs/rails-i18n/raw/master/rails/locale/#{locale}", "config/locales/#{locale}"
end

default_locale = locales.first
environment "config.i18n.default_locale = '#{default_locale.gsub(/\.(yml|rb)$/, '')}'" if default_locale.present?
environment "config.time_zone = 'Europe/Paris'"

git add: '.', commit: "-a -m 'Added #{locales.join(",")} localizations'"
log 'configured', 'internationalization'
