class Story < ApplicationRecord
  include ActiveModel::Validations
  has_many :careers, dependent: :destroy
  accepts_nested_attributes_for :careers, allow_destroy: true
  validates :name, :location, :slug, presence: true
  validates_uniqueness_of :slug
  validate :valid_slug
  validates_with CareerValidator
  #default_scope { order(:created_at) }
  scope :sub_career, -> { joins(:careers) }
  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }

  def to_param
    slug.parameterize
  end

  private
  
  def valid_slug
    if slug.include?("-")
      errors.add(:vanity_url, "Cannot include '-' ")
    end
  end
end
