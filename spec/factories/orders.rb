FactoryBot.define do
  factory :order do
    postal_code {"123-4567"}
    prefecture_id {20}
    municipalities {"甲府"}
    address {"昭和"}
    building_name {"タワーマンション"}
    telephone {"07012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
