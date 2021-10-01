FactoryBot.define do
  factory :item do
    title              {Faker::Internet.name}
    price              {1000}
    explanation        {"うまい"}
    category_id        {3}
    postage_load_id    {4}
    items_condition_id {3}
    prefecture_id      {36}
    shipment_day_id    {2}
  end
end
