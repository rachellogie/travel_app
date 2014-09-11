class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(visited: true)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
    end
  end

  def destroy
    Location.destroy(Location.find(params[:id]))
    redirect_to root_path
  end

  private

  def location_params
    params.require(:location).permit(:country)
  end
end