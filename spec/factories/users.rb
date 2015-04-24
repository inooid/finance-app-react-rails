FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password 'MyPassword'
    password_confirmation 'MyPassword'
  end
end
