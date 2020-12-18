class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        u = User.login(params[:user])
        if u
            # 發號碼牌
            session[:userooo] = u[:id]
            redirect_to root_path, notice: ":::)"
        else
            redirect_to root_path, notice: "OOO:::)"
        end
    end

    def destroy
        session[:userooo] = nil
        redirect_to root_path, notice: "bye::)"
    end

    
end
