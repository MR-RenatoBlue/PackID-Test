class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render nothing: true, status: :not_found }
      format.html { redirect_to root_url, alert: exception.message, status: :not_found }
      format.js   { render nothing: true, status: :not_found }
    end
  end
end
