require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'GET #new' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      get :new
    end
    it "リクエストは200" do
      expect(response.status).to eq 200
    end
    it '@userに新しいユーザーを割り当てること' do
      expect(assigns(:user)).to be_a_new(User)
    end
    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end
    context '有効なパラメーターの場合' do
      before do
        @user = attributes_for(:user)
      end
      it 'リクエストは302' do
        post :create, params: { user: @user }
        expect(response.status).to eq 302
      end
      it 'データベースに新しいユーザーが登録されること' do
        expect{
          post :create, params: { user: @user }
        }.to change(User, :count).by(1)
      end
      it "renders the :new2 template" do
        post :create, params: { user: @user }
        expect(response).to redirect_to :new2_user_registration
      end
    end
    context '無効なパラメーターの場合' do
      before do
        @invalid_user = attributes_for(:user, password: nil)
      end
      it "リクエストは200" do
        post :create, params: { user: @invalid_user }
        expect(response.status).to eq 200
      end
      it 'データベースに新しいユーザーが登録されないこと' do
        expect{
          post :create, params: { user: @invalid_user }
        }.not_to change(User, :count)
      end
      it "renders the :new template" do
        post :create, params: { user: @invalid_user }
        expect(response).to render_template :new
      end
    end
  end

  describe 'sns認証で新規登録' do
    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit new0_user_registration_path
      find(".btn.facebook-btn").click
      # click_on "Facebookで登録"
    end
    it "サインアップするとユーザーが増える" do
      expect{
        find(".btn.facebook-btn").click
      }.to change(User, :count).by(1)
    end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      find(".btn.facebook-btn").click
      expect{
        find(".btn.facebook-btn").click
      }.not_to change(User, :count)
    end
  end
end
