require 'rails_helper'
describe User do
  describe '#create' do

    it "カラムの値が全て入っていたら保存できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "firstnameがない場合は登録できないこと" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end

    it "familynameがない場合は登録できないこと" do
      user = build(:user, familyname: "")
      user.valid?
      expect(user.errors[:familyname]).to include("を入力してください")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it "familyname_kanaがない場合は登録できないこと" do
      user = build(:user, familyname_kana: "")
      user.valid?
      expect(user.errors[:familyname_kana]).to include("を入力してください")
    end

    it "birthyearがない場合は登録できないこと" do
      user = build(:user, birthyear: "")
      user.valid?
      expect(user.errors[:birthyear]).to include("を入力してください")
    end

    it "birthmonthがない場合は登録できないこと" do
      user = build(:user, birthmonth: "")
      user.valid?
      expect(user.errors[:birthmonth]).to include("を入力してください")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以下の場合は登録できないこと" do
      user = build(:user, password: "a0a0a0")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordが英数字以外の場合は登録できないこと" do
      user = build(:user, password: "アイウエオかきくけこ")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "birthyearが数字以外の場合は登録できないこと" do
      user = build(:user, birthyear: "あいうえ")
      user.valid?
      expect(user.errors[:birthyear]).to include("は数値で入力してください")
    end

    it "birthmonthが数字以外の場合は登録できないこと" do
      user = build(:user, birthmonth: "あいうえ")
      user.valid?
      expect(user.errors[:birthmonth]).to include("は数値で入力してください")
    end

    it "birthdayが数字以外の場合は登録できないこと" do
      user = build(:user, birthday: "あいうえ")
      user.valid?
      expect(user.errors[:birthday]).to include("は数値で入力してください")
    end

    it "emailは@がない場合は登録できないこと" do
      user = build(:user, email: "aaa.gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailはドメインがない場合は登録できないこと" do
      user = build(:user, email: "aaa@aaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "重複したemailの場合は登録できないこと" do
      user = create(:user)
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include()
    end

    it "firstname_kanaはカナ以外の場合は登録できないこと" do
      user = build(:user, firstname_kana: "たろう")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "familyname_kanaはカナ以外の場合は登録できないこと" do
      user = build(:user, familyname_kana: "たろう")
      user.valid?
      expect(user.errors[:familyname_kana]).to include("は不正な値です")
    end

  end
end