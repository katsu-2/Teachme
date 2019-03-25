class Recruitment < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :hope_day, :date
  end
end
