class Group < ApplicationRecord
  belongs_to :user
  has_many :group_friends, dependent: :delete_all
  # belongs_to :order, optional: true
  validates :name, presence: true
end
