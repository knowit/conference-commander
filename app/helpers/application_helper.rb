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

  def yesno_icon(pred, display_on_false: true)
    raw begin
      if pred
        fa_icon 'check lg'
      else
        fa_icon 'remove lg' if display_on_false
      end
    end
  end

  def maybe(string)
    begin
      if string.present?
        string
      else
        content_tag(:span, nil, class: 'maybe') do
          raw '&mdash;'
        end
      end
    end
  end

  def empty_table
    I18n.t('misc.empty', name: controller_name.classify.constantize.model_name.human(count: 2).downcase)
  end

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&markers=#{center}&size=300x300&zoom=14&key=AIzaSyDlwOtcsjjH_WsYDmgOUOCoB2OiVgdYsTo"
  end

end
