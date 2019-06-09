class RemoveRecruitmentFromRecruitmentCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :recruitment_categories, :recruitment, index: true, foreign_key: true
  end
end
