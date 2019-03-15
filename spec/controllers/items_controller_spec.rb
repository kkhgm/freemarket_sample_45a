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

  describe 'delete #destroy' do
    it "削除機能の確認" do
      item = create(:item)
      expect{
        delete :destroy, params: { id: item}
      }. to change(Item, :count).by(-1)
    end
  end

  describe 'GET #edit' do
    it "インスタンス変数取得の確認" do
      item = create(:item)
      get :edit, params: { id: item}
      expect(assigns(:item)).to eq item
    end
    it "editビューが描画される" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    it "インスタンス変数取得後、変更の保存確認" do
      item = create(:item)
      item_params = { id: item, name: "hogehoge",description: item, condition: item, shipping_method: item, shipping_charge: item, ship_from_region: item, shipping_date: item, price: item }
      patch :update, params: item_params
      expect(assigns(:item)).not_to eq item
    end
  end

  describe 'POST #create' do
    it "インスタンス変数取得後、保存確認" do
      @item = attributes_for(:item)
      expect{post :create, params: { item: @item}}. to change(Item, :count).by(+1);
    end
  end

  describe 'POST #create' do
    it "インスタンス保存後、indexビューが描画される" do
      @item = attributes_for(:item)
      post :create, params: { item: @item}
      expect(response).to redirect_to action: :index
    end
  end

  describe 'GET #show' do
    it "インスタンス変数取得の確認" do
      item = create(:item)
      get :show, params: { id: item}
      expect(assigns(:item)).to eq item
    end
    it "showビューが描画される" do
      item = create(:item)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end
  end
end
