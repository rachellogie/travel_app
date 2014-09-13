class HomepageController < ApplicationController

  def index
    @trips = current_user.trips.all
  end
end