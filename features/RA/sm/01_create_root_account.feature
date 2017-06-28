Feature: SM-01 - 01 - Create Root Account

  Scenario: [SM-01-01-01]
    1. 註冊超級管理員
    2. 重發認證信
    # 1
    When the user goes to the homepage
    Then the user should see "註冊超級管理員"
    When the user presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "信箱" with "super_admin@example.com"
     And presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should see "兩次輸入須一致"
    When the user fills in "密碼" with "12345678"
     And fills in "密碼確認" with "12345678"
     And presses "提交"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "超級管理員註冊成功，請先前往 super_admin@example.com 信箱完成驗證手續。"
     And "super_admin@example.com" should receive an emails with subject "帳號驗證步驟"
    When "super_admin@example.com" opens the email with subject "帳號驗證步驟"
    Then the user should see "您可以利用下面的連結確認您的帳戶的電子郵件" in the email body
    # 2
    When the user clicks "重發認證信"
     And presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "信箱" with "not_found@example.com"
     And presses "提交"
    Then the user should see "找不到。"
    When the user fills in "信箱" with "super_admin@example.com"
     And presses "提交"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "您將在幾分鐘後收到一封電子郵件，內有驗證帳號的步驟說明。"
     And "super_admin@example.com" should receive an emails with subject "帳號驗證步驟"
    When "super_admin@example.com" opens the email with subject "帳號驗證步驟"
    Then the user should see "您可以利用下面的連結確認您的帳戶的電子郵件" in the email body
    When the user clicks the first link in the email
    Then the user should be at sign in page - "/users/sign_in"
     And should see "您的帳號已通過驗證，現在您已成功登入。"
