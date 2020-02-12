class Ci < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient

    def ingredient_name=(name)
        self.ingredient = Ingredient.find_by(name:name)
    end

    def ingredient_name
        self.ingredient ? self.ingredient.name : nil
    end
end
