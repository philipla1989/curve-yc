class CareerValidator < ActiveModel::Validator

  def validate(record)
    unless record.careers.present?
      record.errors[:career] << "Career isn't present"
    end
  end

end
