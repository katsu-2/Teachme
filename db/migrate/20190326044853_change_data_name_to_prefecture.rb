class ChangeDataNameToPrefecture < ActiveRecord::Migration[5.2]
  def change
    change_column :prefectures, :name, :integer
  end
end
