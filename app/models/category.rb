class Category < ApplicationRecord
  has_many :recruitment_categories
  has_many :recruitments, through: :recruitment_categories

  enum category: {
    IT関係: 1, スポーツ: 2, ファッション: 3, 恋愛: 4, 仕事関係: 5, 勉強: 6, ライフワーク: 7, 手芸: 8, その他: 9
  }
end
