class SkusController < ApplicationController
  def index
    @skus = Sku.all
  end

  def create
    # sku1 = Sku.create(description: "O-ring", part_number: "322212347895", location: "02-32-B5")
    # sku2 = Sku.new(description: "O-ring", part_number: "322212347895", location: "02-32-B5")
    # sku2.save
    @sku = Sku.new(sku_params)
    if @sku.save
      print("Creado correctamente")
    else
      print("No creado")
    end
  end

  private

  def sku_params
    params.require(:sku).permit(:description, :part_number, :location)
  end

end
