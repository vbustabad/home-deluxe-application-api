class User < ApplicationRecord
    has_many :products, through: :orders
    has_one :shopping_cart
end
