class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :ucs
    has_many :users, through: :ucs
    has_many :cis
    has_many :ingredients, through: :cis

    validates :name, presence: true
end
