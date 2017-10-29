class Note < ApplicationRecord
  belongs_to :favorite_school
  validates :content, presence: true
end
