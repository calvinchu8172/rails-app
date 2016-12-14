module ApplicationHelper
  def body_attributes
    {
      data: {
        controller: controller_path,
        action: action_name,
        locale: I18n.locale
      }
    }
  end
end
