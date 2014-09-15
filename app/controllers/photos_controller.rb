class PhotosController < ApplicationController

  before_action :find_trip

  def new
    @photo = Photo.new
  end

  def create
    @photo = @trip.photos.new(photos_params)
    if @photo.save!
      redirect_to trip_path(@trip), notice: 'File successfully uploaded!'
    else
      render :new
    end
  end

  private

  def photos_params
    params.require(:photo).permit(:name, :file)
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end
end