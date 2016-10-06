FactoryGirl.define do
  factory :review do
    title 'Best neighborhood ever'
    body 'Lived here my whole life and it\'s been amazing'
    rating 5

    district
    user
  end
end
