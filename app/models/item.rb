class Item < ApplicationRecord
  belongs_to :order
  belongs_to :user

  delegate :full_name, to: :user, allow_nil: true
  validates :name, presence: true
  validates :amount, presence: true
  validates :price, presence: true
  validates :comment, presence: true
end