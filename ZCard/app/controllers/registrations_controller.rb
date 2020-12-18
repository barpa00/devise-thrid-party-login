class RegistrationsController < ApplicationController
    # include SessionsHelper
    before_action :session_required, only: [:edit, :update]

    def new
      @user = User.new
    end
    
    def create
      @user = User.new(params_user)
      if @user.save
          redirect_to "/", notice: ':)'
      else
          render :new
      end
    end

    def edit
    end

    def update
      current_user.update(params_user)
      redirect_to root_path, notice: "done"
    end


    private
    def params_user
        params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
    end
end
