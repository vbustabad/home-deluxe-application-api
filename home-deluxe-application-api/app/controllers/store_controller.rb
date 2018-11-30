class StoreController < ApplicationController

    def index
        @store = Product.all
    end 
end
