module StoriesHelper

  def get_sub_title(story)
    @values = []
    story.careers.order(:created_at).all[1..-1].each do |career|
       @values << career.jobs.order(:created_at).map(&:title)
    end
    @values = @values.to_s.gsub("\"", '').gsub!(/[\[\]]/,'')
  end

  def get_sub_career_path(story)
    @values = story.careers.order(:created_at).all[1..-1].map(&:ini_career_path)
    @values = @values.to_s.gsub("\"", '').gsub!(/[\[\]]/,'')
  end

  def get_sub_industry(story)
    @values = []
    story.careers.order(:created_at).all[1..-1].each do |career|
       @values << career.jobs.order(:created_at).map(&:industry).uniq
    end
    @values = @values.uniq.to_s.gsub("\"", '').gsub!(/[\[\]]/,'')
  end

  def get_sub_company(story)
    @values = []
    story.careers.order(:created_at).all[1..-1].each do |career|
       @values << career.jobs.order(:created_at).map(&:company).uniq
    end
    @values = @values.uniq.to_s.gsub("\"", '').gsub!(/[\[\]]/,'')
  end

  def get_sub_company_type(story)
    @values = []
    story.careers.order(:created_at).all[1..-1].each do |career|
       @values << career.jobs.order(:created_at).map(&:company_type).uniq
    end
    @values = @values.uniq.to_s.gsub("\"", '').gsub!(/[\[\]]/,'')
  end

  def get_precedent_career(story, career)
    story.careers.where(ini_career_path: career.precedent_career).first.ini_career_path
  end

  def get_current_job(story)
    job = "#{story.careers.order(:created_at).last.jobs.order(:created_at).last.title}, #{story.careers.order(:created_at).last.jobs.order(:created_at).last.company}"
  end

  def get_precedent_job(story, career)
    job = story.careers.where(ini_career_path: career.precedent_career).first.jobs.order(:created_at).last
    job = "#{job.title}, #{job.company}"
  end

  def check_single_job(jobs)
    true if jobs.count == 1
  end

end
