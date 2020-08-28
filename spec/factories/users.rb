FactoryBot.define do
  factory :user do
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    nickname                {Faker::Name.initials}
    real_family_name        {Faker::Name.last_name}
    real_first_name         {Faker::Name.first_name}
    reading_family_name     {Faker::Name.last_name}
    reading_first_name      {Faker::Name.first_name}
    birthday                {Faker::Date.birthday}
  end
end
