class Api::ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index 
        @products = Product.all
        render json: @products
    end 
    
    def new 
        @product = Product.new
        render json: @product, status: 200
    end 

    def create
        @product = Product.new(product_params)

        if @product.save
            render json: @product
        else 
            render json: @product.errors.full_messages, status: 400
        end 
    end 

    def show
        @product = Product.find(params[:id])
        render json: @product, status: 200
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
            render json: @product
        else
            render json: @product.errors.full_messages, status: 400
        end
    end 

    def destroy
        @product = Product.find(params[:id])

        if @product.destroy
            render json: @product, status: 200
        else
            render json: @product.errors.full_messages, status: 400
        end 
    end 

    private

    def product_params
        params.require(:product).permit(:name)
    end
end
