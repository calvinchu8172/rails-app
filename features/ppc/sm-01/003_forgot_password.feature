Feature: PrivatePush Console - SM-01 - 003 - Forgot Password

  Background:
    Given the super admin has already signed up

  Scenario: [SM-01-003-01]
    忘記密碼
    When the user goes to the homepage
    Then the user should be at sign in page - "/users/sign_in"
     And should see "登入"
    When the user clicks "忘記密碼？"
     And presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "信箱" with "not_found@example.com"
     And presses "提交"
    Then the user should see "找不到。"
    When the user fills in "信箱" with "super_admin@example.com"
     And presses "提交"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "您將在幾分鐘後收到一封電子郵件，內有重新設定密碼的步驟說明。"
     And "super_admin@example.com" should receive an emails with subject "密碼重設步驟"
    When "super_admin@example.com" opens the email with subject "密碼重設步驟"
    Then the user should see "有人要求更改密碼的連結，你可以利用下面的連結更改密碼。" in the email body
    When the user clicks the first link in the email
     And presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "密碼" with "11111111"
     And presses "提交"
    Then the user should see "兩次輸入須一致"
    When the user fills in "密碼" with "11111111"
     And fills in "密碼確認" with "11111111"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "您的密碼已被修改，您現在已經登入。"
