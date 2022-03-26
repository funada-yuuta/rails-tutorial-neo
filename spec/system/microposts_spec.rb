require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  describe "投稿フォーム" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    context "投稿の内容がある場合" do
      scenario "投稿が作成される" do
        visit root_path

        expect{
          fill_in "micropost_content", with: "Test"
          click_button "Post"
        }.to change(@user.microposts, :count).by(1)

        expect(current_path).to eq root_path
        expect(page).to have_content "Test"
      end
    end

    context "投稿の内容がある場合" do
      scenario "投稿が作成されない" do
        visit root_path

        expect{
          fill_in "micropost_content", with: ""
          click_button "Post"
        }.to change(@user.microposts, :count).by(0)

        expect(current_path).to eq microposts_path
        expect(page).to have_content "Content can't be blank"
      end
    end
  end
end
