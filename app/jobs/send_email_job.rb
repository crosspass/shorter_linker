class SendEmailJob < ApplicationJob
  def perform(linker_id)
    linker = Linker.find(linker_id)
    LinkerMailer.send_manage_page(linker)
  end
end