class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  # allow_browser versions: :modern
  def after_sign_in_path_for(resources)
    libraries_path
  end
end
