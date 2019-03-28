class Recruitment < ApplicationRecord
  belongs_to :user
  has_many :recruitment_categories
  has_many :categories, through: :recruitment_categories

  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {maximum: 1000}


end
