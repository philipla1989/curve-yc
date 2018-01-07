module StoriesHelper

  def get_sub_title(careers)
    careers.map(&:title).join(", ")
  end

  def get_sub_career_path(careers)
    careers.map(&:name).join(", ")
  end

  def get_sub_industry(careers)
    careers.map(&:industry).uniq.join(", ")
  end

  def get_sub_company(careers)
    careers.map(&:company).uniq.join(", ")
  end

  def get_sub_company_type(careers)
    careers.map(&:company_type).uniq.join(", ")
  end

  def get_precedent_career(career)
    if career.precedent_career.include? "Initial"
      career.story.ini_title
    else
      career.story.careers.where(name: career.precedent_career).first.title
    end
  end

  def check_single_career(careers)
    true if careers.count == 1
  end
end
