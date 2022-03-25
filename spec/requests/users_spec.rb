require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user, :admin)
  end

  describe "GET /index" do
    context "ログインしていない場合" do
      it "ログインんページへリダイレクト" do
        get users_path
        expect(response).to have_http_status "302"
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      it "正常なレスポンスを返す" do
        sign_in @user
        get users_path
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get user_path @user
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    before do
      @user2 = FactoryBot.create(:user, :normal)
    end

    context "ログインしていない場合" do
      it "ログインページへリダイレクト" do
        delete user_path @user
  
        expect(response).to have_http_status "302"
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "管理者でない場合" do
      it "ルートページへリダイレクト" do
        sign_in @user2
        delete user_path @user2
  
        expect(response).to have_http_status "302"
        expect(response).to redirect_to root_path
      end
    end

    context "ログイン状態かつ管理者の場合" do
      it "ユーザー一覧ページへリダイレクト" do
        sign_in @user
        delete user_path @user
  
        expect(response).to have_http_status "302"
        expect(response).to redirect_to users_path
      end

      it "ユーザーが退会する" do
        sign_in @user

        expect {
          delete user_path @user
        }.to change{User.count}.by(-1)
        expect{User.find(@user.id)}.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
