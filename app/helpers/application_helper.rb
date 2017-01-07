module ApplicationHelper
  def body_attributes(options = {})
    # body class
    # 1. 初始化 classes 陣列
    # 2. 如果有 class option, 則加入 classes 陣列中
    # 3. 如果使用者已登入, 則 classes 陣列中加入 nav-md
    # 4. 如果使用者未登入, 則 classes 陣列中加入 devise
    # 5. 將 classes 結合後指定給 option 的 class
    classes = []
    classes << options[:class] if options[:class]
    classes << (user_signed_in? ? 'nav-md' : 'devise')
    options[:class] = classes * ' ' if classes.present?
    # dev options
    dev_options = { data: {
      controller: controller_path,
      action: action_name,
      locale: I18n.locale
    }}
    # 回傳 merged options
    options.merge(dev_options)
  end
end
