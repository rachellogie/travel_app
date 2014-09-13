class TripsController < ApplicationController

  autocomplete :country, :name, :full => true

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.new(trip_params)
    @trip.name = params[:trip][:country]
    if @trip.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(visited: true)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
    end
  end

  def destroy
    Trip.destroy(Trip.find(params[:id]))
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:country_id)
  end
end