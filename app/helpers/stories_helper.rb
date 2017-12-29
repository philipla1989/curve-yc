module StoriesHelper

  def get_sub_title(careers)
    careers.map(&:title).join(", ")
  end

  def get_sub_career_path(careers)
    careers.map(&:name).join(", ")
  end

  def get_sub_industry(careers)
    careers.map(&:industry).join(", ")
  end

  def get_sub_company(careers)
    careers.map(&:company).join(", ")
  end

  def get_sub_company_type(careers)
    careers.map(&:company_type).join(", ")
  end

  def get_precedent_career(career)
    if career.precedent_career == "Initial"
      career.story.ini_career_path
    else
      career.precedent_career
    end
  end

  def check_single_career(careers)
    true if careers.count == 1
  end
end