class SkusController < ApplicationController
  def index
    @skus = Sku.all
    @sku = Sku.new
  end
  def new
    @sku = Sku.new

  end

  def create
    
    has_valid_location = sku_params[:location_ids].reject(&:blank?).any?
    has_valid_qty = sku_params[:qty].to_i > 0
    
    #until = hasta que...
    #unless Condicional Ejecuta el bloque si la condición es falsa if !condición
    #until Bucle Repite el bloque mientras la condición sea falsa while !condición
    #unless = a menos que...
    
    unless has_valid_location && has_valid_qty
      flash.now[:alert] = "Debes ingresar una cantidad y seleccionar al menos una ubicación."
      @sku = Sku.new(sku_params)
      return render :new, status: :unprocessable_entity
    end
    
    @sku = Sku.find_by(part_number: sku_params[:part_number])
    if @sku 
      #Hace la busqueda de las ubicaciones, si ya tiene mercancia en esa ubicacion, simplemente pasa de largo, si ve una nueva la agrega al array
      # |= hace la union de arrays sin duplicados
      @sku.location_ids |= sku_params[:location_ids].reject(&:blank?).map(&:to_i) 
                                                    #.reject { |x| x.blank? }
                                                    #sku_params[:location_ids]
                                                    #.reject { |id| id.blank? }
                                                    #.map    { |id| id.to_i }
      @sku.qty += sku_params[:qty].to_i #|= sku_params[:qty].to_i + @sku.qty
    else
      @sku = Sku.new(sku_params)
    end
    
    if @sku.save
      print("Creado correctamente")
    else
      print("No creado")
    end
  end

  def destroy
    @sku = Sku.find(params[:id])  
    @item_location = ItemLocation.find_by(sku_id: params[:sku_id], location_id: params[:location_id])
    
    @item_location.destroy
    redirect_to locations_path, notice: "SKU eliminado correctamente."
  end

  private

  def sku_params
    params.require(:sku).permit(:description, :part_number, :qty, location_ids: [])
  end

end
