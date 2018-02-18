class Job < ApplicationRecord

  belongs_to :career
  default_scope { order(:created_at) }
end
