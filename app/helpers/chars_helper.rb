module CharsHelper
  def nested_chars(chars)
    chars.map do |char, sub_chars|
      empty = sub_chars.empty?
      render(:partial => 'char', :object => char, :locals => {:empty => empty}) + content_tag(:ul, nested_chars(sub_chars), :style => "display:none;")
    end.join.html_safe
  end

end
