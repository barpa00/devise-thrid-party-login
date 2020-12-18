class RegistrationsController < ApplicationController
    # def index
    #     @user = User.all
    # end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params_user)
        if @user.save
            redirect_to root_path, notice: ":ooo"
        else
            render :new
        end
    end


    private 
    def params_user
        params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
    end
end
