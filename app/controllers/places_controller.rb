class PlacesController < ApplicationController

  def index
    @places = Place.all
    render json: @places
  end

  def show
    @place = Place.find(params[:id])
    render json: @place
  end

  def create
    @place = Place.new(place_params)
    @place.save
    render json: @place
  end

  def delete
    @place = Place.destroy(params[:id])
    render json: @place
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :latitude, :longitude)
  end
end
