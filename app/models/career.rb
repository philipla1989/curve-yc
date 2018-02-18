class Career < ApplicationRecord
  belongs_to  :story
  has_many    :story_questions, dependent: :destroy
  has_many    :jobs, dependent: :destroy
  accepts_nested_attributes_for :story_questions
  accepts_nested_attributes_for :jobs, allow_destroy: true
  default_scope { order(:created_at) }
end
