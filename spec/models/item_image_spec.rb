require 'rails_helper'
describe ItemImage do
  describe '#create' do

    it 'imageがあれば保存できること' do
      expect(build(:item_image, image: nil)).to be_valid include("を入力してください")
    end
    
  end

  describe '#update' do

    it 'imageがあれば保存できること' do
      expect(build(:item_image, image: nil)).to be_valid include("を入力してください")
    end
  
  end
end
