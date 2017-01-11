@timecop
Feature: PrivatePush Console - SM-01 - 006 - User Detail

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given the user manager has already been created by super admin

  @javascript
  Scenario: [SM-01-006-01]
    1. 查看人員帳號詳細資訊
    2. 編輯人員帳號
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
    When the user clicks "檢視" link on User List table Row "1"
    Then the user should be at user detail page - "/admin/users/2"
     And should see "信箱 user_manager@example.com"
     And should see "暱稱 UserManager"
     And should see "角色 使用者管理員"
     And should see "登入次數"
     And should see "登入時間"
     And should see "被新增時間 2017-01-01 20:00:00 +0800"
     And should see "新增人 super_admin@example.com"
     And should see "被鎖定時間"
    # 2
     And should see "編輯"
    When the user clicks "編輯"
    Then the user should be at user edit page - "/admin/users/2/edit"
     And should see "信箱 user_manager@example.com"
    When the user selects "應用管理員" from "角色"
     And presses "提交"
    Then the user should be at user detail page - "/admin/users/2"
     And should see "角色 應用管理員"
