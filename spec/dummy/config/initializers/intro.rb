Intro.configure do
  # class name of your User Modal, default: 'User'
  # self.user_class = 'User'

  # current_user method name in your controller, default: 'current_user'
  # self.current_user_method = 'current_user'

  # after user touches a tour more than max count, the tour doesn't display. default: 1
  # self.max_touch_count = 1

  # admin account for accessing background web, default value by SecureRandom#urlsafe_base64
  self.admin_username = ENV['INTRO_APP_ADMIN_USERNAME'] || "WRDkzl4"
  self.admin_password = ENV['INTRO_APP_ADMIN_PASSWORD'] || "8ud1c_3vU5idynBN1gE8pUDnDVs"
end