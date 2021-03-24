##
# Linker for user's url changed to short path
class Linker < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :url, presence: true, uniqueness: { scope: :email }

  # enum status: %i[sleeping active]

  before_create :set_uid, :set_short_path
  after_create :send_show_url_mail

  def visit
    self.times += 1
    save!
  end

  def toggle_status
    update(status: !status)
  end

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
    # SendEmailJob.perform_later(id)
    UserMailer.with(linker: self).generate_short_url.deliver_now
  end
end
