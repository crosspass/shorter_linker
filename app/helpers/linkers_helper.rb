module LinkersHelper
  def short_url(linker)
    [request.base_url, linker.short_path].join('/')
  end
end
