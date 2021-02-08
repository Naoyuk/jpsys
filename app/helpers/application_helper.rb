# frozen_string_literal: true

module ApplicationHelper
  def active_nav_item(item)
    url = request.url

    return ' active active-underscore' if url.include?(item)
  end
end
