class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:not_found]

  def not_found
    linker = Linker.find_by(short_path: request.path[1..])
    raise ActionController::RoutingError, 'Not Found' unless linker

    linker.visit
    redirect_to linker.url
  end
end
