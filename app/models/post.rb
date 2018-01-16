class Post < ApplicationRecord

  validates :title, :content, :topic, :author, :slug, presence: true
  validates_uniqueness_of :slug

  def to_param
    slug.parameterize
  end
end
