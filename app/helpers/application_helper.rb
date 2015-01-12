module ApplicationHelper
  def flash_messages
    if flash[:alert].present?
      content_tag(:div, class: 'alert alert-danger', role: 'alert'){ flash[:alert] }
    elsif flash[:notice].present?
      content_tag(:div, class: 'alert alert-info', role: 'alert'){ flash[:notice] }
    end
  end
end
