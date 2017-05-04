class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.integer :servings, null:false

      t.timestamps
    end
  end
end
