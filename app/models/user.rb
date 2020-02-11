class User < ApplicationRecord
    has_secure_password

    has_many :ucs
    has_many :cocktails

    validates :name, presence: true
    #validates :name, uniqueness: true
end
