module ApplicationHelper

  def get_options(field)
    options = Category.where(name: field).first
    if options.present?
      options.description.split("|").sort!
    else
      ["Pleas add #{field} in category"]
    end
  end

  def get_multiselect_value(params)
    if params.present?
      params = params.gsub("\"", '').gsub!(/[\[\]]/,'').split(/\s*,\s*/)
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

  def get_initial_company(career)
    @precedent_career = Career.where(name: career.precedent_career, story_id: career.story_id).first
    @company = career.precedent_career.include?("Initial") ? career.story.ini_company : @precedent_career.company
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", form: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-primary btn-sm", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
