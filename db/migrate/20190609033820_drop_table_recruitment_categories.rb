class DropTableRecruitmentCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :recruitment_categories
  end
end
