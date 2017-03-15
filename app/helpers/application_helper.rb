module ApplicationHelper
  def flash_class(level)
  case level.to_sym
    when :notice, :success then "ui info message"
    when :alert, :error then "ui error message"
    else "ui #{level} message"
  end
end
end
