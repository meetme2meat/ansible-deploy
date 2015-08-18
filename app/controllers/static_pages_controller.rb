class StaticPagesController < ApplicationController
  def index
    
  end
  def about_us
    @user = User.new
  end
end
