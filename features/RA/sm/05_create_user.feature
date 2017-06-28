@timecop
Feature: SM-01 - 05 - Create User

  Background:
    Given the super admin has already signed up

  @javascript
  Scenario: [SM-01-05-01]
    1. 新增人員帳號
    2. 重寄認證信
    3. 人員帳號進行認證及設定密碼
    # 1
    When the user goes to the homepage
    Then the user should be at sign in page - "/users/sign_in"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should be at dashboard page - "/"
    When the user clicks "人員帳號管理" within "側邊功能"
    Then the user should see "人員帳號列表"
    When the user clicks "人員帳號列表" within "側邊功能"
    Then the user should be at users list page - "/admin/users"
     And should see "新增人員"
    When the user clicks "新增人員"
    Then the user should be at create user page - "/admin/users/creation/new"
    When the user fills in "信箱" with "user_manager@example.com"
     And selects "使用者管理員" from "角色"
     And presses "提交"
    Then the user should see "已寄送認證信件給 user_manager@example.com。"
     And should see "信箱" - "user_manager@example.com" on Users List table Row "1"
     And should see "角色" - "使用者管理員" on Users List table Row "1"
     And "user_manager@example.com" should receive an emails with subject "認證說明"
    When "user_manager@example.com" opens the email with subject "認證說明"
    Then the user should see "你可以透過以下連結進行認證：" in the email body
    # 2
    When the user clicks "檢視" link on User List table Row "1"
    Then the user should be at user detail page - "/admin/users/2"
     And should see "重寄認證信"
    When the user clicks "重寄認證信"
     And accepts a confirm message - "您確定要執行？"
    Then the user should see "已成功重新寄送認證信件給 user_manager@example.com。"
    # 3
    When the user clicks "SuperAdmin"
     And clicks "登出"
    Then the user should be at sign in page - "/users/sign_in"
     And should see "成功登出了。"
     And "user_manager@example.com" should receive an emails with subject "認證說明"
    When "user_manager@example.com" opens the last email
    Then the user should see "你可以透過以下連結進行認證：" in the email body
    When the user clicks the link in the email - "/users/creation/accept"
    Then the user should see "設置密碼"
    When the user presses "提交"
    Then the user should see "不能為空白"
    When the user fills in "密碼" with "11111111"
     And presses "提交"
    Then the user should see "兩次輸入須一致"
    When the user fills in "密碼" with "11111111"
     And fills in "密碼確認" with "11111111"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "你已經成功設置密碼及登入本站。"
