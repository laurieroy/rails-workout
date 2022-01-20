class DashboardsController < ApplicationController

  def index
    # @athletes = User.all
    @pagy, @athletes = pagy(User.all, items: 5)
  end
end
