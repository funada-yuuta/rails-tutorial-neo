require 'rails_helper'

RSpec.describe Micropost, type: :model do  
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }

  it "有効なファクトリを持つ" do
    expect(FactoryBot.create(:micropost)).to be_valid
  end

  it "content、userがあれば有効" do
    micropost = Micropost.new(
      content: "MyText",
      user: user
    )
    expect(micropost).to be_valid
  end

  it "作成日が最近のものから順に並ぶ" do
    FactoryBot.create_list(:micropost, 3, user: user)
    micropost = FactoryBot.create(:micropost, user: admin)

    expect(Micropost.find(micropost.id)).to eq Micropost.first
  end

  it "投稿主が削除されると投稿も削除される" do
    micropost = FactoryBot.create(:micropost, user: user)

    expect{
      user.destroy
    }.to change{Micropost.count}.by(-1)
    expect{Micropost.find(micropost.id)}.to raise_error ActiveRecord::RecordNotFound
  end

  context "content" do
    it "contentがないと無効" do
      micropost = Micropost.new(content: nil)
      micropost.valid?
      expect(micropost.errors[:content]).to include("can't be blank")
    end

    it "contentが140文字以上なら無効" do
      micropost = Micropost.new(content: 'a' * 141)
      micropost.valid?
      expect(micropost.errors[:content]).to include("is too long (maximum is 140 characters)")
    end
  end

  context "user" do
    it "userがないと無効" do
      micropost = Micropost.new(user: nil)
      micropost.valid?
      expect(micropost.errors[:user_id]).to include("can't be blank")
    end
  end
end
