class Post < ApplicationRecord

  validates :title, :content, :topic, :author, presence: true
end
