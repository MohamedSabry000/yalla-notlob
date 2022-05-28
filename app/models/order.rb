class Order < ApplicationRecord
  belongs_to :user

  has_many :groups
  has_many :friends
  has_many :order_friends, dependent: :destroy

  # has_many :notifications, dependent: :destroy

  has_many :items, dependent: :destroy
end
