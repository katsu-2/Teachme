class RemoveCategoryFromRecruitmentCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :recruitment_categories, :category, index: true, foreign_key: true
  end
end
