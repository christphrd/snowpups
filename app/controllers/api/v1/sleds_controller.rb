class Api::V1::SledsController < ApplicationController
  def index
    @sleds = Sled.all
    render json: @sleds
  end

  def show
    @sled = Sled.find(params[:id])
    render json: @sled
  end
end
