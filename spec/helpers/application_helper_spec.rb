require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do

    context "引数がない場合" do
      it "'Ruby on Rails Tutorial Sample App'が返る" do
        title = full_title()
  
        expect(title).to eq("Ruby on Rails Tutorial Sample App")
      end
    end

    context "引数がある場合" do
      it "'引数 | Ruby on Rails Tutorial Sample App'が返る" do
        title = full_title("Home")
  
        expect(title).to eq("Home | Ruby on Rails Tutorial Sample App")
      end
    end
  end
end
