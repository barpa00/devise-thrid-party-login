module SessionsHelper
    def current_user
        if session[:userooo].present?
          @uu = User.find_by(id: session[:userooo])
        else
          nil
        end
    end
end
