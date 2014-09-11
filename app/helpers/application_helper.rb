module ApplicationHelper

  def title
    "Have You Been To&hellip;".html_safe
  end

  def angular_js_include_tags(components = [])
    [nil, components].flatten.map { |component| angular_js_include_tag component }.join("\n").html_safe
  end

  def angular_js_include_tag(component = nil)
    angular = "angular-#{component}".sub(/-\Z/, '')
    javascript_include_tag "//ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.1/#{angular}.min.js"
  end

end
