class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      paginate_feed
    end
  end

  def help
  end
end
