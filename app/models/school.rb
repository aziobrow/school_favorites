class School < ApplicationRecord
  validates :school_number, :name, presence: true, uniqueness: true
  validates :address, :principal, :description, presence: true
  belongs_to :district
  has_many :favorite_schools
  has_many :users, through: :favorite_schools
end
