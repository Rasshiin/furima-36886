FactoryBot.define do
  factory :user do
    nickname              {"ジャイアン"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"剛田"}
    family_name_kana      {"ゴウダ"}
    first_name            {"武"}
    first_name_kana       {"タケシ"}
    birthday              {"1975-6-15"}
  end
end