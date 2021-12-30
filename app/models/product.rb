class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  
  validates_presence_of :name, :description, :categories
  validates :price, presence: true, numericality: true
end
