class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(whitlisted_user_params)

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(whitlisted_user_params)
            flash.notice = "Updated"
            redirect_to @user
        else
            render :edit
        end
    end


    def show
        @user = User.find(params[:id])
    end

    private

    def whitlisted_user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
