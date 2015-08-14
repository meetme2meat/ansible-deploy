module ApplicationHelper
  #show validation errors below text_field
  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        field_name.to_s.humanize + " "+ object.errors.messages[field_name].join(", ")
      end
    end
  end 

  #assign class to flash message as per their type
  def class_for_flash_message(flash_type)
    case flash_type
    when "notice"
      "alert-success"
    when "alert"
      "alert-danger"
    when "error"
      "alert-danger"
    end
  end
end
