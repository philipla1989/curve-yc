class Career < ApplicationRecord
  belongs_to  :story
  has_many    :story_questions, dependent: :destroy
  accepts_nested_attributes_for :story_questions

  validates :name, :title, :industry, :company, :precedent_career, presence: true
end
