FactoryGirl.define do
  factory :user do
    first_name "Graceffa"
    last_name "Jewlz"
    sequence(:username) { |n| "jewlz#{n}" }
    password "annielover"
    password_confirmation "annielover"
    sequence(:email) { |n| "jewlzzz#{n}@gmail.com" }
  end
end
