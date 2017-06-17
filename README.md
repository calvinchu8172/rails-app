# Rails App

## BDD - Cucumber

#### Setup test database

Check test database and development database is not the same, and run below command:

``` sh
$ bin/rails db:environment:set RAILS_ENV=test && bin/rails db:drop db:create db:migrate db:seed RAILS_ENV=test
```

#### Online guides

- Cucumber: https://github.com/cucumber/cucumber
- Capybara: https://github.com/jnicklas/capybara
- Rspec: http://www.relishapp.com/rspec/

#### Install for Selenium Webdriver

- Chrome: https://www.google.com/chrome/

- Chrome Driver

``` sh
$ brew install chromedriver
```

#### Run Cucumber

``` sh
# run all feature
$ cucumber

# run single feature
$ cucumber feature_path -r features

## 產生 Schema 異動對照檔

``` sh
$ git diff --no-prefix -U1000 old_commit new_commit -- db/schema.rb > schema.txt
```

## 使用 Bower 安裝 assets

### 使用 nvm 安裝 node.js 環境

- [安裝 nvm](https://github.com/creationix/nvm#install-script)
- [安裝 node](https://github.com/creationix/nvm#usage)

### 安裝 bower

``` sh
$ npm install bower -g
```

### 安裝 bower components

``` sh
$ bin/rails bower:install bower:resolve
```
