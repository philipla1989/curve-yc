class StoryQuestion < ApplicationRecord
  belongs_to :career

  validates :question, :response, presence: true
end
