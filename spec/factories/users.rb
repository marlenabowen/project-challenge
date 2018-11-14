FactoryBot.define do
  factory :user do
    sequence :email do |email|
      "test-#{email}@example.com"
    end

    sequence :password do |password|
      "password"
    end
  end
end
