class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # pw = Digest::SHA1.hexdigest("o#{params[:user][:password]}o")
        # @user = User.find_by(email: params[:user][:email], password: pw)
        # u = @user 
        u = User.login(params[:user])
        if 
            session[:userooo] = u[:id]
            redirect_to root_path, notice: "ooooo"
        else
            redirect_to root_path , notice: "uuu"
        end
    end

    def destroy
        session[:userooo] = nil
        redirect_to root_path
    end
end
