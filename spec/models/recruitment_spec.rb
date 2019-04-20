require 'rails_helper'

RSpec.describe Recruitment, type: :model do
  describe " バリデーションテスト" do
    it "投稿が有効" do
      expect(build(:recruitment)).to be_valid
    end

    it "タイトルが無ければ無効" do
      recruitment = Recruitment.new(title: nil)
      recruitment.valid?
      expect(recruitment.errors[:title]).to include("can't be blank")
    end

    it "内容が無ければ無効" do
      recruitment = Recruitment.new(content: nil)
      recruitment.valid?
      expect(recruitment.errors[:content]).to include("can't be blank")
    end

    it "タイトルは30字以内" do
      recruitment = Recruitment.new(title: "a" * 31)
      recruitment.valid?
      expect(recruitment.errors[:title]).to include("is too long (maximum is 30 characters)")
    end

    it "内容は1000字以内" do
      recruitment = Recruitment.new(content: "a" * 1001)
      recruitment.valid?
      expect(recruitment.errors[:content]).to include("is too long (maximum is 1000 characters)")
    end
  end
end

