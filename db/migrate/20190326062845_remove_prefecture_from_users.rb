class RemovePrefectureFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :prefecture, index: true
  end
end
