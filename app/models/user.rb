class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true
end
