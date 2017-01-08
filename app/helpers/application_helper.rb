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

  # Check if a particular controller is the current one
  #
  # args - One or more controller names to check
  #
  # Examples
  #
  #   # On TreeController
  #   current_controller?(:tree)           # => true
  #   current_controller?(:commits)        # => false
  #   current_controller?(:commits, :tree) # => true
  def current_controller?(*args)
    args.any? { |v| v.to_s.downcase == controller.controller_path }
  end

  # Check if a particular action is the current one
  #
  # args - One or more action names to check
  #
  # Examples
  #
  #   # On Projects#new
  #   current_action?(:new)           # => true
  #   current_action?(:create)        # => false
  #   current_action?(:new, :create)  # => true
  def current_action?(*args)
    args.any? { |v| v.to_s.downcase == action_name }
  end

  # Check if a particular namespace is the current one
  #
  # args - One or more namespace names to check
  #
  # Examples
  #
  #   # On Admin::Projects#new
  #   current_namespace?(:admin)        # => true
  #   current_namespace?(:api)          # => false
  #   current_namespace?(:api, :admin)  # => true
  def current_namespace?(*args)
    namespace = controller.controller_path.split('/').first
    args.any? { |v| v.to_s.downcase == namespace }
  end

  def active_link?(options)
    if path = options.delete(:path)
      unless path.respond_to?(:each)
        path = [path]
      end

      path.any? do |single_path|
        current_path?(single_path)
      end
    else
      c = options.delete(:controller)
      a = options.delete(:action)

      if c && a
        # When given both options, make sure BOTH are true
        current_controller?(*c) && current_action?(*a)
      else
        # Otherwise check EITHER option
        current_controller?(*c) || current_action?(*a)
      end
    end
  end

  def current_path?(path)
    c, a, _ = path.split('#')
    current_controller?(c) && current_action?(a)
  end
end
