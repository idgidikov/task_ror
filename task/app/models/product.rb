class Product < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
