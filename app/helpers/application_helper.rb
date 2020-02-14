module ApplicationHelper
  def flash_class(level)
    level = level.to_s if level
    case level
    when 'success' then "success"
    when 'fail', 'danger'
     "danger"
    when 'warning' then "warning"
    end
  end
end
