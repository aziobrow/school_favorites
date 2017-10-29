class FavoriteSchool < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :notes
end
