class TshirtsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]

  def index
    @tshirts = Tshirt.all
  end

  def new
    @tshirt = Tshirt.new
  end

  def show
    @tshirt = Tshirt.find( params[:id] )
  end

  def edit
    @tshirt = Tshirt.find( params[:id] )
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    if @tshirt.save
      redirect_to @tshirt
    end
  end

  def update
    @tshirt = Tshirt.find( params[:id] )
    if @tshirt.update(tshirt_params)
      redirect_to @tshirt
    end
  end

  def destroy
    @tshirt = Tshirt.find( params[:id] )
    @tshirt.destroy
    redirect_to tshirts_url
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:title, :photo_url)
  end

end
