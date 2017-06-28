Feature: SM-01 - 04 - User List

  Background:
    Given the super admin has already signed up

  Scenario: [SM-01-04-01]
    查看人員帳號列表
    When the user goes to the homepage
    Then the user should be at sign in page - "/users/sign_in"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should be at dashboard page - "/"
     And should see "人員帳號管理"
    When the user clicks "人員帳號管理" within "側邊功能"
    Then the user should see "人員帳號列表"
    When the user clicks "人員帳號列表" within "側邊功能"
    Then the user should be at user list page - "/admin/users"
     And should see "人員帳號列表"
     And should see "信箱" - "super_admin@example.com" on User List table Row "1"
     And should see "暱稱" - "SuperAdmin" on User List table Row "1"
     And should see "角色" - "超級管理員" on User List table Row "1"
