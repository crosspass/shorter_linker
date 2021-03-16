class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.action_mailer.smtp_settings[:from]
  layout 'mailer'
end
