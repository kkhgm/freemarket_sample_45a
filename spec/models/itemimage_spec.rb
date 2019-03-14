require 'rails_helper'

RSpec.describe Itemimage, type: :model do
	describe Itemimage do
    it "画像が保存できていないとバリデーションで弾かれる" do
      item_image = build(:itemimage, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("can't be blank")
    end
  end
end
