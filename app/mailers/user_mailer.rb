class UserMailer < ApplicationMailer
  def generate_short_url
    @linker = params[:linker]
    mail(to: @linker.email, subject: 'Generate short url successful!')
  end
end