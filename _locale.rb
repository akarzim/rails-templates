locales = (ENV['LOCALES'] || ask('Which locales do you want to use (separate with commas if more)?')).split(/[,\s]+/)
locales = [locales].flatten(1).compact

locales.each do |locale|
  locale += '.yml' unless locale =~ /\.(yml|rb)$/
  get "https://github.com/svenfuchs/rails-i18n/raw/master/rails/locale/#{locale}", "config/locales/#{locale}"
end

default_locale = locales.first
environment "config.i18n.default_locale = '#{default_locale.gsub(/\.(yml|rb)$/, '')}'" if default_locale.present?
environment "config.time_zone = 'Europe/Paris'"

git add: '.', commit: "-a -m 'Added #{locales.join(",")} localizations'"
log 'configured', 'internationalization'
