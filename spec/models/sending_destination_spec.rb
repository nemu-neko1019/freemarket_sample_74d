require 'rails_helper'
describe SendingDestination do
  describe '#create' do

    it "カラムの値が全て入っていたら保存できること" do
      sending_destination = build(:sending_destination)
      expect(sending_destination).to be_valid
    end

    it "prefecture_idがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, prefecture_id: "")
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture_id]).to include("を入力してください")
    end

    it "municipal_districtがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, municipal_district: "")
      sending_destination.valid?
      expect(sending_destination.errors[:municipal_district]).to include("を入力してください")
    end

    it "housenumberがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, housenumber: "")
      sending_destination.valid?
      expect(sending_destination.errors[:housenumber]).to include("を入力してください")
    end

    it "phonenumberがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, phonenumber: "")
      sending_destination.valid?
      expect(sending_destination.errors[:phonenumber]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, user_id: "")
      sending_destination.valid?
      expect(sending_destination.errors[:user_id]).to include()
    end

    it "postalcodeがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, postalcode: "")
      sending_destination.valid?
      expect(sending_destination.errors[:postalcode]).to include("を入力してください")
    end

    it "postalcodeが8文字以上の場合は登録できないこと" do
      sending_destination = build(:sending_destination, postalcode: "48484843")
      sending_destination.valid?
      expect(sending_destination.errors[:postalcode]).to include("は不正な値です")
    end

    it "postalcodeが6文字以上の場合は登録できないこと" do
      sending_destination = build(:sending_destination, postalcode: "484847")
      sending_destination.valid?
      expect(sending_destination.errors[:postalcode]).to include("は不正な値です")
    end

    it "postalcodeが数字以外の場合は登録できないこと" do
      sending_destination = build(:sending_destination, postalcode: "あいうえおかき")
      sending_destination.valid?
      expect(sending_destination.errors[:postalcode]).to include("は不正な値です")
    end

    it "phonenumberが9文字以下の場合は登録できないこと" do
      sending_destination = build(:sending_destination, phonenumber: "098675843")
      sending_destination.valid?
      expect(sending_destination.errors[:phonenumber]).to include("は不正な値です")
    end

    it "phonenumberが12文字以上の場合は登録できないこと" do
      sending_destination = build(:sending_destination, phonenumber: "123456789089")
      sending_destination.valid?
      expect(sending_destination.errors[:phonenumber]).to include("は不正な値です")
    end

    it "phonenumberが数字以外の場合は登録できないこと" do
      sending_destination = build(:sending_destination, phonenumber: "あいうえおかきくけこ")
      sending_destination.valid?
      expect(sending_destination.errors[:phonenumber]).to include("は不正な値です")
    end


  end
end