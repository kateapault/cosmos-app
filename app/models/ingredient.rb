class Ingredient < ApplicationRecord
    has_many :cis
    has_many :cocktails, through: :cis

    validates :name, presence: true
end
