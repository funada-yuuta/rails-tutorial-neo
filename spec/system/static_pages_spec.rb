require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "ルートページ" do
    context "非ログインの場合" do
      scenario "正しいビューが表示される" do
        visit root_path
  
        expect(page).to have_selector('h1'), text: 'Welcome to the Sample App'
        expect(page).to have_link 'Sign up now!', href: new_user_registration_path
      end
    end

    context "ログインしている場合" do
      scenario "正しいビューが表示される" do
        user = FactoryBot.create(:user)
        micropost = FactoryBot.create(:micropost, user: user)
        sign_in user
        visit root_path

        expect(page).to have_selector('h1'), text: user.name
        expect(page).to have_selector('h3'), text: 'Micropost Feed'
        expect(page).to have_selector('.microposts .content'), text: micropost.content
      end
    end
  end
end
