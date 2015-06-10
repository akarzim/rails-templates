locales = (ENV['LOCALES'] || ask('Which locales do you want to use (separate with commas if more)? [en]')).split(/[,\s]+/)
locales = [locales].flatten(1).compact.map do |locale|
  locale.gsub(/\.yml$/, '')
end

insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
  <<-CODE
  scope "(:locale)", locale: /#{locales.join('|')}/ do
  end
  CODE
end

locales.each do |locale|
  append_to_file 'app/views/layouts/_header.slim', <<-CODE
      = link_to('#{locale.upcase}', params.merge(locale: :#{locale.downcase}), class: 'locale')
  CODE

  git rm: "config/locales/#{locale}.yml" if locale == 'en'
  get "https://github.com/svenfuchs/rails-i18n/raw/master/rails/locale/#{locale}.yml", "config/locales/#{locale}.yml"
end

default_locale = locales.first
environment "config.i18n.default_locale = '#{default_locale.gsub(/\.(yml|rb)$/, '')}'" if default_locale.present?
environment "config.time_zone = 'Europe/Paris'"

inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController' do
  <<-CODE
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  CODE
end

git add: '.', commit: "-a -m 'Added #{locales.join(",")} localizations'"
log 'configured', 'internationalization'
