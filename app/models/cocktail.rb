class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :ucs
    has_many :users, through: :ucs
    has_many :cis
    has_many :ingredients, through: :cis

    validates :name, presence: true

    def ingredients_names
        self.ingredients.map { |i| i.name }
    end

    def ci_check(params)
        ing_id = params["ingredient_id"].to_i
        input_amount = params["amount"].to_i

        cis = Ci.all.select { |ci| ci.cocktail_id == self.id }

        if ci = cis.find { |ci| ci.ingredient_id == ing_id }
            if input_amount == 0
                ci.delete
            elsif input_amount != ci.amount
                ci.update(amount:input_amount)
            end
        elsif input_amount > 0
             Ci.create(cocktail_id:self.id,ingredient_id:ing_id,amount:input_amount)
        end
    end

end
