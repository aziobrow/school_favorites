class District < ApplicationRecord
  validates :name, :board_member, presence: true, uniqueness: true
  has_many :schools
end
