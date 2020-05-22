require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#pay' do
    it "user_idがない場合は登録できないこと" do
      card = Card.new(user_id: "", customer_id: "cus_8734c75ee80c80aa11302f03fda5", card_id: "car_0e127d775c0ca15dca27ac5a5ad3")
      card.valid?
      expect(user.errors[:user]).to include("can't be blank")
    end

    it "customer_idがない場合は登録できないこと" do
      card = Card.new(user_id: "3", customer_id: "", card_id: "car_0e127d775c0ca15dca27ac5a5ad3")
      card.valid?
      expect(user.errors[:customer_id]).to include("can't be blank")
    end

    it "card_idがない場合は登録できないこと" do
      card = Card.new(user_id: "3", customer_id: "car_0e127d775c0ca15dca27ac5a5ad3", card_id: "")
      card.valid?
      expect(user.errors[:customer_id]).to include("can't be blank")
    end
  end
end
