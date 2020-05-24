require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#pay' do
    it "user_id,customer_id,card_idがあれば登録できること" do
      user = create(:user)
      card = build(:card, user_id: user.id)
      expect(card).to be_valid
    end

    it "user_idがない場合は登録できないこと" do
      card = build(:card, user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end

    it"customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
