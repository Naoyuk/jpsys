module ApplicationHelper
  def active_nav_item(item)
    url = request.url

    if url.include?(item)
      return " active active-underscore"
    end
  end
end
