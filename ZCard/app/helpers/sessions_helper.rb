module SessionsHelper
    def current_user
        if session[:userooo].present?
            @ooo ||= User.find_by(id: session[:userooo])
        else
            nil
        end
    end

    def session_required
      redirect_to sign_in_users_path , notice: "先登入" unless current_user 
    end
end
