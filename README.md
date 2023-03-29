# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.6

* System dependencies: MySQL, Rail 5.2.8.1

* Additional gem: 
gem 'bcrypt', '~> 3.1.7'   -> for password encrypted
gem 'video_info'		   -> for retrieving youtube video info.	


Steps to deploy:
- Config credential MySQL for config/database.yml
- Run: bundle install
- Run: rails db:create
- Run: rails db:migrate
- Run: rails server

For test:
Run: rails test