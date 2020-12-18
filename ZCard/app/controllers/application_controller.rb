class ApplicationController < ActionController::Base
    include SessionsHelper

    # find_by/find找不到東西
    # ActiveRecord::RecordNotFound in BoardsController
    # rescue_from ActiveRecord::RecordNotFound, with: :notice 
    
    private
    def notice                   
    render file: 'public/404.html', layout: false, status: 404
                                                        #  :not_found
                                                        #  :ok
    # redirect_to root_path, notice: "not found!!!!"
    end

end
