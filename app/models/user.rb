class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :favorite_schools
  has_many :schools, through: :favorite_schools

  enum role: ["default", "admin"]

  def self.omniauth(auth_hash)
    user = User.find_by(email: auth_hash[:info][:email])
    user
  end

end
