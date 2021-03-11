module ApplicationHelper
  def short_url(path)
    "#{request.base_url}/#{path}"
  end
end
