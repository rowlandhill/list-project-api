class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe

  accepts_nested_attributes_for :ingredients
end
