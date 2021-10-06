FactoryBot.define do
  factory :order do
    postal_code {"123-4567"}
    prefecture_id {20}
    municipalities {"甲府"}
    address {"昭和"}
    building_name {"タワーマンション"}
    telephone {"07012345678"}
  end
end
