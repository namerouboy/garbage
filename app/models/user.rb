class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:line]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = "#{auth.uid}@line.example.com" # 仮のemail
      user.password = Devise.friendly_token[0, 20] # 仮のパスワード
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end