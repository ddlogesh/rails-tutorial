class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

  def activated_user
    unless current_user.activated?
      store_location
      flash[:warning] = "Please check your email to activate your account."
      redirect_to redirect_to login_url
    end
  end

  def paginate_feed
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
