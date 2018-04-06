class Job < ApplicationRecord

  belongs_to :career
  default_scope { order(:created_at) }
  validates :title, :company, :industry, :company_type, presence: true
end
