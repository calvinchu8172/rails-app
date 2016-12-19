module ApplicationHelper
  def body_attributes(options = {})
    {
      data: {
        controller: controller_path,
        action: action_name,
        locale: I18n.locale
      }
    }.merge options
  end
end
