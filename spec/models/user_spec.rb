require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    it "名前+メールアドレス+パスワードがあれば有効" do
      expect(build(:user)).to be_valid
    end

    it "名前が無いと無効" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "メールアドレスが無いと無効" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "重複するメールアドレスは無効" do
      user = create(:user, email: "a@example.com")
      user = build(:user, email: "a@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "パスワードが無ければ無効" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
