class ShoppingCart < ApplicationRecord
    has_and_belongs_to_many :products
    belongs_to :user
end
