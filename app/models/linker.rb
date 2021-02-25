##
# Linker for user's url changed to short path
class Linker < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :url, presence: true

  before_create :set_uid, :set_short_path
  after_create :send_show_url_mail

  private

  def set_uid
    loop do
      uid = SecureRandom.uuid
      unless Linker.exists?(uid: uid)
        self.uid = uid
        break
      end
    end
  end

  def set_short_path
    loop do
      path = SecureRandom.base64(8).gsub('/', '_').gsub(/=+$/, '')
      unless Linker.exists?(short_path: path)
        self.short_path = path
        break
      end
    end
  end

  def send_show_url_mail
    SendEmailJob.perform_later(id)
  end
end
