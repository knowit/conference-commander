module ApplicationHelper

  def flash_class(level)
    case level.to_sym
    when :notice, :success then "ui info message"
    when :alert, :error then "ui error message"
    else "ui #{level} message"
    end
  end

  # Standard field for attachment upload
  # Add data attributes for client check
  def image_file_field(form_builder)
    image = form_builder.object
    form_builder.file_field :file, as: :file, class: 'image_file', id: 'image_files'
  end

end
