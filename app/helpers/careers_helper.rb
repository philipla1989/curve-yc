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
    if story.id.present?
      values = story.careers.order(:created_at).map(&:ini_career_path).uniq
    else
      values = Category.where(name: "Career Path").first
      if values.present?
        values = values.description.split("|").sort!
        values.unshift("Initial")
      else
        ["Pleas add #{field} in category"]
      end
    end
  end
end
