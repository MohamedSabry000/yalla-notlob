class Friend < ApplicationRecord
  belongs_to :user
  validates :email, presence: true

end
