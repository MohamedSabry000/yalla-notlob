class GroupFriend < ApplicationRecord
    belongs_to :group
    belongs_to :friend
    belongs_to :order
  end
  