FactoryBot.define do
  factory :item do
    association :user
    title              {"たこ"}
    price              {1000}
    explanation        {"うまい"}
    category_id        {3}
    postage_load_id    {4}
    items_condition_id {3}
    prefecture_id      {36}
    shipment_day_id    {2}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
