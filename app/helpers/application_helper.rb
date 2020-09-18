module ApplicationHelper
  def flash_messages(*)
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message.html_safe,
                    role: "alert",
                    class: "notification #{bootstrap_class_for(msg_type)}") do
          concat(message.html_safe)
        end
      )
      flash.clear
    end
    nil
  end

  def bootstrap_class_for(flash_type)
    {
      success: "text-success",
      error: "text-danger",
      alert: "text-warning",
      notice: "text-info"
    }[flash_type.to_sym]
  end
end
