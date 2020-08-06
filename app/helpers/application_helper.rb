module ApplicationHelper
  def active_nav_item(item)
    url = request.url
    pos = url.rindex("/") + 1
    func = url.slice(pos, url.length - pos)
    if func == item
      return " active active-underscore"
    end
  end
end
