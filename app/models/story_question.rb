class StoryQuestion < ApplicationRecord
  belongs_to :story

  validates :question, :response, presence: true
end
