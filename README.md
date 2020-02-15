# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5.7

### Steps to config this app:
- clone or download this app
- cd inside app's folder
- create your local database and user (https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04)
- run `bundle install`
- run `bundle exec figaro install`

Figaro will generate for you a file `config/application.yml`. We will use the file to config param `ENV['DB_PASSWORD']` for `config/database.yml`

For example:

db_password: `your-db-password-here`

production: <br/>
  db_password: `your-db-password-here`

- run `rails db:setup`
- run `rails db:migrate`
- run `rails db:seed_fu` (using `seed_fu` gem).
- run `rails server` and visit `http://localhost:3000` in your favorite browser.

### How to use this app? There are several functions:
- Log in/log out.
- Create new blog post. (for sign-in user)
- Post comments. (for sign-in user)
- Allows visitors to view post list, and sort them by created date.
- Resful API to get blog posts data with (Need authorization key on request header by JsonWebToken)

