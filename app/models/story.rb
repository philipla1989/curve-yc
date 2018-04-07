class Story < ApplicationRecord
  include ActiveModel::Validations
  has_many :careers, dependent: :destroy
  accepts_nested_attributes_for :careers, allow_destroy: true
  validates :name, :location, :slug, presence: true
  validates_uniqueness_of :slug
  validates_with CareerValidator
  default_scope { order(:created_at) }
  scope :sub_career, -> { joins(:careers) }

  def to_param
    slug.parameterize
  end
end
