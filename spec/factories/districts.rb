FactoryGirl.define do
  factory :district do
    sequence(:name) { |n| "District #{n}" }
    description 'A wonderful location in the heart of Greater Boston.'
    user
  end
end
