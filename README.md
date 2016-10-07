STOMPING GROUND
![Build Status](https://codeship.com/projects/762ba050-6ba7-0134-6128-7ea83503a0a9/status?branch=master)
![Code Climate](https://codeclimate.com/github/snartiff/stomping-ground.png)
![Coverage Status](https://coveralls.io/repos/snartiff/stomping-ground/badge.png)

* Heroku Link
https://stomping-ground.herokuapp.com/

* Description
Stomping Ground is a place where you can review your favorite neighborhood in Boston! If you are moving and need to know the best place to look for housing, this site will help you decide on what neighborhood you want to live in. 

* Authors
Annie Kim
Julie Graceffa
Kyle Wood
Sean Nartiff

* Ruby version
Ruby version 2.2.3

* Configuration
Run the following (after git cloning):

bundle install
rake db:create
rake db:migrate
rails s

* Features
- User signs up
- User uploads a profile picture
- User can view and review neighborhoods
- User upvotes or downvotes API (user can only vote once)
- Neighborhood creater recieves email when someone reviews their API
- Admin has ability to delete content if inappropriate
- Admin has ability to delete user account if they violate terms of use

* Technologies Utilized
- Rails
- Ajax
- JQuery
- Devise (User Authentication)
- CarrierWave (Photo Uploads)
- Factory_Girl (Test Data)
- SendGrid (ActionMailer)
