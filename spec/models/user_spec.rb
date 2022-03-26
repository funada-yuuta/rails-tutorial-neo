require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つ" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前、メールアドレス、パスワードがあれば有効" do
    user = User.new(
      name: "Test",
      email: "text@example.com",
      password: "testpass",
      password_confirmation: "testpass"
    )
    expect(user).to be_valid
  end

  context "name" do
    it "名前がないと無効" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  
    it "名前が51文字以上だと無効" do
      user = User.new(name: 'a' * 51)
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
  end
end
