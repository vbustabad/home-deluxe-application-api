class ProductsController < ApplicationController
    
    def new 
        @product = Product.new
    end 

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to product_path(@product)
        else 
            render :new
        end 
    end 

    def edit
        @product = Product.find(params[:id])

        if current_user.admin
            render :edit
        else
            redirect_to root_path
        end
    end 

    def update 
        @product = Product.find(params[:id])
        @product.update(product_params)

        if @product.save
            redirect_to product_path(@product)
        else
            render :edit
        end
    end 

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to store_path
    end 

    private

    def product_params
        params.require(:product).permit(:name)
    end
end
