#STOMPING GROUND

![Build Status](https://codeship.com/projects/762ba050-6ba7-0134-6128-7ea83503a0a9/status?branch=master)
![Code Climate](https://codeclimate.com/github/snartiff/stomping-ground.png)
![Coverage Status](https://coveralls.io/repos/snartiff/stomping-ground/badge.png)

#Heroku Link

https://stomping-ground.herokuapp.com/


#Description

Stomping Ground is a place where you can review your favorite neighborhood in Boston! If you are moving and need to know the best place to look for housing, this site will help you decide on what neighborhood you want to live in.

#Authors

Annie Kim

Julie Graceffa

Kyle Wood

Sean Nartiff


#Ruby version

Ruby version 2.3.1


#Configuration

Run the following (after git cloning):

bundle install

npm install

rake db:create

rake db:migrate

npm start

rails s


#Features
- User has ability to signs up and update profile
- User uploads a profile picture
- User can view and review neighborhoods
- User can up vote or down vote each review (user can only vote once)
- Neighborhood creator receives an email when someone reviews their neighborhood
- Neighborhood creator has the ability it update or delete their neighborhood
- User has ability to update delete their review
- Admin has ability to delete content if inappropriate
- Admin has ability to delete a user account if they violate terms of use
- The index page for neighborhoods live-updates using React.js


#Technologies Utilized
- Rails
- Ajax
- React
- JQuery
- Devise (User Authentication)
- CarrierWave (Photo Uploads)
- Gmail SMTP (ActionMailer)
- Testing: Factory_Girl, Capybara, RSpec
- Sass
