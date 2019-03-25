class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.string :title, null: false, index: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
