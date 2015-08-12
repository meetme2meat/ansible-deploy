module UsersHelper
  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
       field_name.to_s.humanize + " "+ object.errors.messages[field_name].join(", ")
      end
    end
  end 
end
