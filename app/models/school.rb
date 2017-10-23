class School < ApplicationRecord
  validates :school_number, :name, presence: true, uniqueness: true
  validates :address, :principal, :description, presence: true
  belongs_to :district
end
