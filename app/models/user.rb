class User < ApplicationRecord
  validates :uid, presence: true
  validates :pass, presence: true
end