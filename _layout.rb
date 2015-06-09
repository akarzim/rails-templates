insert_into_file 'app/helpers/application_helper.rb', after: "module ApplicationHelper\n" do
  <<-CODE
  def flash_message
    flash.map do |key, msg|
      next if msg.blank?
      content_tag :div, class: "flash-\#{key}" do
        content_tag :span, msg.gsub('\\n', '<br>').html_safe
      end
    end.join.html_safe
  end
  CODE
end

remove_file 'app/views/layouts/application.html.erb'
template 'app/views/layouts/application.slim.tt'
template 'app/views/layouts/_header.slim.tt'
template 'app/views/layouts/_footer.slim.tt'
