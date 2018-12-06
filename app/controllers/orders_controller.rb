class OrdersController < ApplicationController

    def new 
        @order = Order.new
        render json: @order, status: 200
    end 

    def create
        @order = Order.new(order_params)

        if @order.save
            render json: @order
        else 
            render json: {message: @order.errors.full_messages}, status: 400
        end 
    end

    def destroy
        @order = Order.find(params[:id])

        if @order.destroy
            render json: @order {message: "Order has been successfully deleted."}, status: 200
        else
            render json: {message: "Unable to delete this order."}, status: 400
        end 
    end 

    private

    def order_params
        params.require(:order).permit(:name)
    end
end
