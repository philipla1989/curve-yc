class Post < ApplicationRecord

  validates :title, :content, :topic, :author, :vanity_url, presence: true

  def to_param
    [id, vanity_url.parameterize].join("-")
  end
end
