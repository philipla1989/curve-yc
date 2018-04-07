class JobValidator < ActiveModel::Validator

  def validate(record)
    unless record.jobs.present?
      record.errors[:job] << "Job isn't present"
    end
  end

end
