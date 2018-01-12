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

  def get_precedent_career_path(story)
    @careers_array = []
    @careers_array << story.ini_career_path
    story.careers.order(:created_at).map(&:name).each{ |c| @careers_array << c}
  end

  def get_precedent_career_title(career)
    if career.precedent_career.include?("Initial")
      @precedent_career = career.story.ini_title
    else
      @precedent_career = Career.where(name: career.precedent_career).first.title
    end
  end

  def get_precedent_company_name(story)
    @companies_array = []
    @companies_array << story.ini_company
    story.careers.order(:created_at).map(&:company).uniq.each{ |c| @companies_array << c}
  end

  def check_single_career(careers)
    true if careers.count == 1
  end
end
