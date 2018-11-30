class OrdersController < ApplicationController

    def new 
        @order = Order.new
    end 

    def create
        @order = Order.new(owner_params)

        if @order.save
            redirect_to order_path(@order)
        else 
            render :new
        end 
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to store_path
    end 

    private

    def order_params
        params.require(:order).permit(:name)
    end
end
