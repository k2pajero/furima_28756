FactoryBot.define do
  Faker::Config.locale ='ja'
  factory :user do
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    nickname                {Faker::Name.initials}
    real_family_name        {Faker::Name.last_name}
    real_first_name         {Faker::Name.first_name}
    reading_family_name     {Gimei::Name.last.katakana}
    reading_first_name      {Gimei::Name.first.katakana}
    birthday                {Faker::Date.birthday}
  end
end
