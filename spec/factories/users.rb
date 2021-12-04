FactoryBot.define do
  factory :user do
    username { 'myusername' }
    email { 'myemail@gmail.com' }
    password { 'mypassword' }
  end
end
