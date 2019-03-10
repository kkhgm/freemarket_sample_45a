require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'GET #new' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end
    it "リクエストは200" do
      expect(response.status).to eq 200
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = create(:user)
      sign_in @user
    end
    it 'リクエストは302' do
      post :create
      expect(response.status).to eq 302
    end
    it "renders the :root template" do
      post :create
      expect(response).to redirect_to :root
    end
  end
  describe 'DELETE #destroy' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = create(:user)
      sign_in @user
    end
    it 'リクエストは302' do
      delete :destroy
      expect(response.status).to eq 302
    end
    it "renders the :root template" do
      delete :destroy
      expect(response).to redirect_to :root
    end
  end
end
