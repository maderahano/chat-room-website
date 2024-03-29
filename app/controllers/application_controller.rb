class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery with: :null_session,
        if: Proc.new { |c| c.request.format =~ %r{application/json} }

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
    end
end
