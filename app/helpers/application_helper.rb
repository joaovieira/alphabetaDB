module ApplicationHelper

  def unicode_tag unicode, options
    packed = unicode_to_string(unicode)

    if options[:type] == 'sound'
      content_tag(:span, "/" + packed + "/", :class => "sound")
    else
      selector = options[:selector]? "selector" : ""
      content_tag(:span, packed, :class => "glyph " + selector)
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
