Feature: PrivatePush Console - SM-01 - 008 - Change Password

  Background:
    Given the super admin has already signed up

  Scenario: [SM-01-008-01]
    1. 修改密碼
    2. 使用新密碼登入
    # 1
    When the user goes to the homepage
    Then the user should be at sign in page - "/users/sign_in"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should be at dashboard page - "/"
    When the user clicks "SuperAdmin"
     And clicks "修改個人檔案"
    Then the user should be at change password page - "/admin/users/edit"
    When the user presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "密碼" with "11111111"
     And presses "提交"
    Then the user should see "兩次輸入須一致"
    When the user fills in "密碼" with "11111111"
     And fills in "密碼確認" with "11111111"
     And fills in "目前密碼" with "12345678"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "您已經成功的更新帳號資訊。"
    # 2
    When the user clicks "SuperAdmin"
     And clicks "登出"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "成功登出了。"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "11111111"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "成功登入了。"
