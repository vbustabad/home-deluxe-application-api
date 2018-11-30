class Product < ApplicationRecord
    belongs_to :category
    has_and_belongs_to_many :shopping_carts
    has_and_belongs_to_many :orders
end
