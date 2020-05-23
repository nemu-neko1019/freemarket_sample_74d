FactoryBot.define do

  factory :sending_destination do
    prefecture_code       {"30"}
    municipal_district    {"大阪市北区"}
    housenumber           {888}
    buildingname          {"フリマ"}
    phonenumber           {"09000000000"}
    user_id               {1}
    postalcode            {"7657463"}
    user
  end

end