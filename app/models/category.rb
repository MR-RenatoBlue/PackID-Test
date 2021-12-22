class Category < ApplicationRecord
  has_many :categorizations
  has_many :products, through: :categorizations

  validates :name, presence: true
end
