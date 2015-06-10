root = ask 'What is the name of the root controller? [welcome#home]'
welcome, home = root.downcase.split '#'
welcome ||= 'welcome'
home ||= 'home'

insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
  <<-CODE
  root '#{welcome}##{home}'
  get '#{welcome}/#{home}'
  get '/:locale' => '#{welcome}##{home}', as: :locale_root
  CODE
end

generate :controller, welcome

inject_into_class "app/controllers/#{welcome}_controller.rb", "#{welcome.classify}Controller" do
  <<-CODE
  def #{home}
  end
  CODE
end

create_file "app/views/#{welcome}/#{home}.slim"
