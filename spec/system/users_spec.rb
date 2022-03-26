require 'rails_helper'

RSpec.describe "Users", type: :system do
  include ApplicationHelper

  describe "サインアップ" do
    context "名前がある場合" do
      scenario "サインアップに成功する" do
        visit new_user_registration_path
        expect{
          fill_in "Name", with: "Test"
          fill_in "Email", with: "test@example.com"
          fill_in "Password", with: "testpass"
          fill_in "Confirmation", with: "testpass"
          click_button "Create my account"
        }.to change{ User.count }.by(1)
    
        expect(current_path).to eq root_path
        expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
      end
    end

    context "名前がない場合" do
      scenario "サインアップに失敗する" do
        visit new_user_registration_path
        expect{
          fill_in "Email", with: "test@example.com"
          fill_in "Password", with: "testpass"
          fill_in "Confirmation", with: "testpass"
          click_button "Create my account"
        }.to change{ User.count }.by(0)
    
        expect(current_path).to eq users_path
        expect(page).to have_content "Name can't be blank"
      end
    end
  end
end
