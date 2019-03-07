require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "出品した商品が最新順にソートされて表示される" do
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "indexビューが描画される" do
      get :index
      expect(response).to render_template :index
    end

  end
end
