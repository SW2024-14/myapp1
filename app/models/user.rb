class User < ApplicationRecord
  # バリデーション（入力チェック）
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  validates :address, :phone, presence: true
end
