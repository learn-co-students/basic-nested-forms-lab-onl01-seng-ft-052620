class Recipe < ActiveRecord::Base
  has_many :ingredients 

  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attr)
    ingredients_attr.values.each do |ingredient_attribute|
      self.ingredients << Ingredient.where(name: ingredient_attribute[:name]).first_or_create do |t|
        t.quantity = ingredient_attribute[:quantity]
        
      end

    end
    

  end
end
