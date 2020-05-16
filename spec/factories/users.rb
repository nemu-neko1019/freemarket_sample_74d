FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.first_name}
    firstname             {"太郎"}
    familyname            {"山田"}
    firstname_kana        {"タロウ"}
    familyname_kana       {"ヤマダ"}
    birthyear             {"2017"}
    birthmonth            {10}
    birthday              {30}
    email                 {Faker::Internet.email(domain: 'example')}
    password              {"a9a9a9a9"}
    password_confirmation {"a9a9a9a9"}
  end

end