module ApplicationHelper

  def get_options(field)
    options = Category.where(name: field).first
    if options.present?
      options.description.split("|")
    else
      ["Pleas add #{field} in category"]
    end
  end

end
