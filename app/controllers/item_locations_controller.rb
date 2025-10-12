class ItemLocationsController < ApplicationController
  def destroy
     @item_location = ItemLocation.find_by(sku_id: params[:sku_id], location_id: params[:location_id])
    if @item_location
      @item_location.destroy
      redirect_to locations_path, notice: "SKU eliminado de la ubicación correctamente."
    else
      redirect_to locations_path, alert: "No se encontró la relación SKU-Ubicación."
    end
  end
end
