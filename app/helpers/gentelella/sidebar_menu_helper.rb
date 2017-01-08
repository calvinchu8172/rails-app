module Gentelella
  module SidebarMenuHelper

    def sidebar_menu_item(options = {}, &block)
      html_options = options.delete(:html_options) || {}
      html_options = html_options.symbolize_keys

      classes = []
      classes << html_options[:class] if html_options[:class]
      classes << 'active' if active_link?(options)
      html_options[:class] = classes * ' ' if classes.present?

      if block_given?
        content_tag(:li, capture(&block), html_options)
      else
        content_tag(:li, nil, html_options)
      end
    end

    def sidebar_child_menu_item(options = {}, &block)
      html_options = options.delete(:html_options) || {}
      html_options = html_options.symbolize_keys

      classes = []
      classes << html_options[:class] if html_options[:class]
      classes << 'current-page' if active_link?(options)
      html_options[:class] = classes * ' ' if classes.present?

      if block_given?
        content_tag(:li, capture(&block), html_options)
      else
        content_tag(:li, nil, html_options)
      end
    end
  end
end
