require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  describe "GET /index" do
    context "ログインしていない場合" do
      it "ログインページへリダイレクト" do
        get microposts_path

        expect(response).to have_http_status "302"
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it "ルートページへリダイレクト" do
        get microposts_path

        expect(response).to have_http_status "302"
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST /create" do
    context "ログインしていない場合" do
      it "ログインページへリダイレクト" do
        post microposts_path

        expect(response).to have_http_status "302"
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      context "有効な属性値の場合" do
        it "投稿が作成できる" do
          expect{
            post microposts_path, params: {
              micropost: { content: 'MyText' }
            }
          }.to change(@user.microposts, :count).by(1)
        end

        it "ルートページへリダイレクトする" do
          post microposts_path, params: {
            micropost: { content: 'MyText' }
          }

          expect(response).to have_http_status "302"
          expect(response).to redirect_to root_path
        end
      end

      context "有効な属性値の場合" do
        it "投稿が作成できない" do
          expect{
            post microposts_path, params: {
              micropost: { content: '' }
            }
          }.to change(@user.microposts, :count).by(0)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    before do
      @user = FactoryBot.create(:user)
      @micropost = FactoryBot.create(:micropost, user: @user)
    end

    context "ログインしていない場合" do
      it "ログインページへリダイレクト" do
        delete micropost_path @micropost

        expect(response).to have_http_status "302"
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      before do
        sign_in @user
      end

      context "正しいユーザーの場合" do
        it "投稿が削除できる" do
          expect{
            delete micropost_path @micropost
          }.to change(@user.microposts, :count).by(-1)
        end
      end

      context "正しいユーザーでない場合" do
        before do
          @user2 = FactoryBot.create(:user, :admin)
          @micropost2 = FactoryBot.create(:micropost, user: @user2)
        end

        it "投稿を削除できない" do
          expect {
            delete micropost_path @micropost2
          }.to change(@user2.microposts, :count).by(0)
        end
      end
    end
  end
end
