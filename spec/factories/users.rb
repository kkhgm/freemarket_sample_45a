FactoryBot.define do
  factory :user do
    nickname {"steve"}
    email {Faker::Internet.email}
    password {"111111"}
    password_confirmation {"111111"}
    last_name {"yama"}
    first_name {"taro"}
    last_name_kana {"yama"}
    first_name_kana {"taro"}
    birthday_info {"1990-01-20"}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
