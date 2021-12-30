class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  
  validates_presence_of :name, :description#
  validates_presence_of :categories#, as: :categories_id
  validates :price, presence: true, numericality: true
end
