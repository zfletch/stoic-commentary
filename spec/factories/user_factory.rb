FactoryBot.define do
  factory :user do
    name { 'Test User' }
    sequence(:email) { |n| "test-#{n}@example.com" }
    role { :contributor }
    password { 'p@ssw0rd' }
    password_confirmation { 'p@ssw0rd' }
  end
end
