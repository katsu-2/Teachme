class Recruitment < ApplicationRecord
  belongs_to :user
  has_many :recruitment_categories
  has_many :categories, through: :recruitment_categories
end
