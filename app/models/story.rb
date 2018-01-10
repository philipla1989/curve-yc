class Story < ApplicationRecord
  has_many :careers
  accepts_nested_attributes_for :careers
  validates :name, :location, :sumary, :ini_age, :sub_age, :ini_title, :ini_career_path, :ini_industry, presence: true

  scope :sub_career, -> { joins(:careers) }
end
