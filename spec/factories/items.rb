FactoryBot.define do
  factory :item do
    name              {"何の変哲もないギター"}
    description       {"ご存知の通りギターです"}
    condition         {"普通"}
    shipping_method   {"ゆうパック"}
    shipping_charge   {"着払い"}
    ship_from_region  {"大阪府"}
    shipping_date     {"4~7日以内に発送"}
    price             {Faker::Number.number(4)}
    created_at        {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
