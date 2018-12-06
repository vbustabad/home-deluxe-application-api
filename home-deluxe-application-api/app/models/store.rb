class Store < ApplicationRecord
    has_many :products
    has_many :categories, through: :products
    has_many :users
    has_many :orders
    has_many :shopping_carts  
end
