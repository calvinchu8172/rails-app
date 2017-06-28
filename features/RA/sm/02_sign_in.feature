Feature: SM-01 - 02 - Sign In

  Background:
    Given the super admin has already signed up

  Scenario: [SM-01-02-01]
    1. 管理人員登入
    2. 管理人員登出
    # 1
    When the user goes to the homepage
    Then the user should be at sign in page - "/users/sign_in"
     And should see "登入"
    When the user presses "提交"
    Then the user should see "信箱或密碼是無效的。"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "成功登入了。"
    # 2
    When the user clicks "SuperAdmin"
     And clicks "登出"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "成功登出了。"
