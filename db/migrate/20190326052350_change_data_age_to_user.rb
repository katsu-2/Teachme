class ChangeDataAgeToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :age, :integer
    change_column :users, :sex, :integer
    change_column :users, :self_introduction, :text
  end
end
