class Order < ApplicationRecord
    has_and_belongs_to_many :products
    has_many :users, through: :products
end
