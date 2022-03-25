require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "サインアップ" do
    context "名前がある場合" do
      scenario "サインアップに成功する" do
        visit new_user_registration_path
        fill_in "Name", with: "Test"
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "testpass"
        fill_in "Confirmation", with: "testpass"
        click_button "Create my account"
    
        expect(current_path).to eq root_path
        expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
      end
    end

    context "名前がない場合" do
      scenario "名前がない場合サインアップに失敗する" do
        visit new_user_registration_path
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "testpass"
        fill_in "Confirmation", with: "testpass"
        click_button "Create my account"
    
        expect(current_path).to eq users_path
        expect(page).to have_content "Name can't be blank"
      end
    end
  end

end
