# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :uid, presence: true
  def admin?
    email == 'admin@example.com'  # 管理者のメールアドレスで判定
  end

end