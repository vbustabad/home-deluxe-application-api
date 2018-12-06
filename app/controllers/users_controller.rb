class UserController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update]
    
    def index
        @users = User.all
        render json: @users, status: 200
    end

    def new
        @user = User.new
        render json: @user, status: 200
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            render json: @user
        else 
            render json: {message: @user.errors.full_messages}, status: 400
        end 
    end

    def show
        @user = User.find(params[:id])

        if current_user == @user
            render json: @user, status: 200
        else
            redirect_to root_path
        end
    end

    def edit
        @user = User.find(params[:id])

        if current_user.admin
            render :edit
        elsif current_user == @user
            render :edit
        else
            redirect_to root_path
        end
    end

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)

        if @user.save
            render json: @user
        else
            render json: {message: @user.errors.full_messages}, status: 400
        end
    end 

    def destroy
        @user = User.find(params[:id])

        if @user.destroy
            render json: @user {message: "User has been successfully deleted."}, status: 200
        else
            render json: {message: "Unable to delete this user."}, status: 400
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :admin, :provider, :uid)
    end
end
