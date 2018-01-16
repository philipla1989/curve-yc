class Story < ApplicationRecord
  has_many :careers, dependent: :destroy
  accepts_nested_attributes_for :careers
  validates :name, :location, :sumary, :ini_age, :sub_age, :ini_title, :ini_career_path, :ini_industry, presence: true
  validates_uniqueness_of :slug

  scope :sub_career, -> { joins(:careers) }



  def to_param
    slug.parameterize
  end

end
