class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
      @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to @band, notice: "Your band was successfully created."
    else
      render :new
    end
  end

  def update
    if @band.update(band_params)
      redirect_to @band, notice: "Your Band was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @band.destroy
    redirect_to root_path, notice: "Your band was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band
    @band = Band.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def band_params
  params.require(:band).permit(:name, :release, :website, :facebook, :instagram, :youtube, :spotify, :soundcloud, :email, :local, :team, :photo)
  end

end
