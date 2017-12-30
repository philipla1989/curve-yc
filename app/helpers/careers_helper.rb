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
    if story.careers.empty?
      [story.ini_career_path]
    else
      story.careers.map(&:name)
    end
  end
end
