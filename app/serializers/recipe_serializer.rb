class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :servings
end
