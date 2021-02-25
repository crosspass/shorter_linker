class LinkerMailer < ApplicationMailer
  def  send_manage_page(linker)
    @linker = linker
  end
end