module CareersHelper

  def get_career_path(story)
    @story = Story.find params[:story_id]
    if @story.careers.empty?
      return ["test", "test1"]
    else
      return  @story.careers.map{ |c| [c.name] }
    end
  end

  def get_precedent_options(story)
    if story.careers.count < 1
      ["Initial - #{story.ini_career_path}"]
    else
      values = story.careers.map(&:name)
      values.push("Initial - #{story.ini_career_path}") if params[:id].present?
      values
    end
  end
end
