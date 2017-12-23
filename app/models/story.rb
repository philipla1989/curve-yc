class Story < ApplicationRecord
  has_many :story_questions

  validates :name, :location, :sumary, :ini_age, :sub_age, presence: true

end
