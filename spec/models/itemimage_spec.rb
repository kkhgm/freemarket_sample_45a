require 'rails_helper'

RSpec.describe Itemimage, type: :model do
	describe Itemimage do
	  it "画像が保存できていないとバリデーションで弾かれる" do
	    itemimage = build(:itemimage, image: nil)
	    itemimage.valid?
	    expect(itemimage.errors[:image]).to include("can't be blank")
	  end
	end
end
