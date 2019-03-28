class Category < ApplicationRecord
  has_many :recruitment_categories
  has_many :recruitments, through: :recruitment_categories
end
