class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @skus = Sku.all
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      print("Creado correctamente")
    else
      print("No creado")
    end
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
