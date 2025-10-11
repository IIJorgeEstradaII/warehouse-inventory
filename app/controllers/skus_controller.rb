class SkusController < ApplicationController
  def index
    @skus = Sku.all
    @sku = Sku.new
  end

  def create
    @sku = Sku.find_by(part_number: sku_params[:part_number])
    
    if @sku
      @sku.location_ids |= sku_params[:location_ids].reject(&:blank?).map(&:to_i)
      @sku.qty += sku_params[:qty].to_i #|= sku_params[:qty].to_i + @sku.qty
      @sku.save
      @sku.reload
    else
      @sku = Sku.new(sku_params)
    end
    
    if @sku.save
      print("Creado correctamente")
    else
      print("No creado")
    end
  end

  private

  def sku_params
    params.require(:sku).permit(:description, :part_number, :qty, location_ids: [])
  end

end
