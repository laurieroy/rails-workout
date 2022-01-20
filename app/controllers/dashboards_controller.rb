class DashboardsController < ApplicationController

  def index
    # @athletes = User.all
    @pagy, @athletes = pagy(User.all, items: 5)
  end

  def search 
    @athletes = User.search_by_name(params[:search_name])
  end
end
