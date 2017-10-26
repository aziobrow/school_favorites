class FavoriteSchool < ApplicationRecord
  belongs_to :user
  belongs_to :school
end
