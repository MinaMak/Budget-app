class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {scope: :user_id}

  has_many :expenses
  belongs_to :user
end
