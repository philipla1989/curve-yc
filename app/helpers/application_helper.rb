module ApplicationHelper

  def get_options(field)
    options = Category.where(name: field).first
    if options.present?
      options.description.split("|")
    else
      ["Pleas add #{field} in category"]
    end
  end

  def markdown(text)
    options = {
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      no_intra_emphasis:  true,
      underline:          true,
      space_after_headers: true,
      highlight:          true,
      quote:              true,
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def show_page(page)
    page = Page.where(name: page).first
    page.content if page.present?
  end

  def get_precedent_career(career)
    if career.precedent_career.include?("Initial")
      @precedent_career = career.story.ini_title
    else
      @precedent_career = Career.where(name: career.precedent_career).first.title
    end
  end
  def get_initial_company(career)
    @precedent_career = Career.where(name: career.precedent_career, story_id: career.story_id).first
    @company = career.precedent_career.include?("Initial") ? career.story.ini_company : @precedent_career.company
  end

end
