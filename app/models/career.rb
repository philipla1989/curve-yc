class Career < ApplicationRecord
  belongs_to  :story
  has_many    :story_questions
end
