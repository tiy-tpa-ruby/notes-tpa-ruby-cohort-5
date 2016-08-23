module ApplicationHelper
  def class_for_controller(name)
    if controller_name == name
      "active"
    else
      ""
    end
  end
end
