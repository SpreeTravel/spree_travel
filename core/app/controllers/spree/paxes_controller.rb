class Spree::PaxesController < ApplicationController
  before_action :set_pax, only: [:show, :edit, :update, :destroy]

  # GET /spree/paxes
  def index
    @paxes = Spree::Pax.all
  end

  # GET /spree/paxes/1
  def show
  end

  # GET /spree/paxes/new
  def new
    @pax = Spree::Pax.new
  end

  # GET /spree/paxes/1/edit
  def edit
  end

  # POST /spree/paxes
  def create
    @pax = Spree::Pax.new(pax_params)

    if @pax.save
      redirect_to @pax, notice: 'Pax was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /spree/paxes/1
  def update
    @pax = Spree::Pax.find(params[:id])
    if @pax.update_attributes(pax_params)
      redirect_to '/cart', notice: 'Pax was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /spree/paxes/1
  def destroy
    @pax.destroy
    redirect_to spree_paxes_url, notice: 'Pax was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pax
      @spree_pax = Spree::Pax.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pax_params
      params.require(:pax).permit(:first_name, :last_name, :sex, :birth)
    end
end
