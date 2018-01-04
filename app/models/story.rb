class Story < ApplicationRecord
  has_many :careers

  validates :name, :location, :sumary, :ini_age, :sub_age, presence: true

  scope :sub_career, -> { joins(:careers) }
end
