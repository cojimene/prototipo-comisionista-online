class PropertiesController < ApplicationController

  load_and_authorize_resource

  # GET /properties
  # GET /properties.json
  def index
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    respond_to do |format|
      if @property.save
        add_images
        format.html { redirect_to @property, notice: 'La propiedad fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        add_images
        format.html { redirect_to @property, notice: 'La propiedad fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'La propiedad fue exitosamente enviada al infierno.' }
      format.json { head :no_content }
    end
  end

private

  def property_params
    params.require(:property).permit(:property_type, :area, :area, :rooms, :bathrooms, :price, :price, :age, :stratum,
      :floor, :description, :parkings, :neighborhood, :address, :city, :availability, :images).merge user: current_user
  end

  def add_images
    if images = params[:property][:images]
      if images.size > Property::MAX_IMAGES
        flash[:alert] = "No puedes agregar más de #{Property::MAX_IMAGES} imágenes"
      else
        images.each { |image| @property.images.create(attachment: image) }
      end
    end
  end

end
