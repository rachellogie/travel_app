class TripsController < ApplicationController

  autocomplete :country, :name, :full => true

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
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

  def update
    @trip = Trip.find(params[:id])
    #if params[:trip] is necessary or it blows up on the ajax call
    if params[:trip]
      @trip.update_attributes(trip_params)
    else
      @trip.update_attributes(visited: true)
    end

    respond_to do |format|
      format.html {redirect_to trip_path(@trip)}
      format.js {}
    end
  end

  def destroy
    Trip.destroy(Trip.find(params[:id]))
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:country_id, :date)
  end
end