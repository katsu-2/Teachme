class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  scope :belongs_to_group_id, -> (group_id) { where(group_id: group_id)}
  scope :your_id, -> (user_id) { where.not(user_id: user_id) }


end
