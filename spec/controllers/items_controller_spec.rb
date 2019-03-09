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

  describe 'GET #edit' do
    it "インスタンス変数取得の確認" do
      items = create(:item)
      get :edit, params: { id: items }
      expect(assigns(:item)).to eq items
    end
    it "editビューが描画される" do
      items = create(:item)
      get :edit, params: { id: items }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    it "インスタンス変数取得後、変更の保存確認" do
      items = create(:item)
      item_params = { id: items, name: "hogehoge",description: items, condition: items, shipping_method: items, shipping_charge: items, ship_from_region: items, shipping_date: items, price: items }

      patch :update, params: item_params
      expect(assigns(:item)).to eq items
    end
  end
end
