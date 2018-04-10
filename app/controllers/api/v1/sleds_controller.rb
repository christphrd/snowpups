class Api::V1::SledsController < ApplicationController
  def index
    @sleds = Sled.all
    render json: @sleds
  end

  def show
    @sled = Sled.find(params[:id])
    render json: @sled
  end

  def create
    @sled = Sled.new(sled_params)
    if @sled.valid?
      @sled.save
      render json: @sled
    end
  end

  def update
    @sled = Sled.find(params[:id])
    if @sled.update(sled_params)
      render json: @sled
    end
  end

  def destroy
    @sled = Sled.find(params[:id])
    @sled.destroy
  end


  private

  def sled_params
    params.require(:sled).permit(:name, :imageUrl)
  end
end
