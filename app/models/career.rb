class Career < ApplicationRecord
  belongs_to  :story
  has_many    :story_questions
  accepts_nested_attributes_for :story_questions

end
