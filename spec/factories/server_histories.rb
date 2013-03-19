# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :server_history do
    server_id 1
    status "MyString"
  end
end
