class Expense < ApplicationRecord
  validates_presence_of :name, :date, :category
  validates :value, presence: true, numericality: {greater_than: 0}
  belongs_to :category
end
