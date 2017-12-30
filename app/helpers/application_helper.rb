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

end
