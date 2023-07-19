##
# Wuyingchao profile
class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  layout false

  def show;  end
end
