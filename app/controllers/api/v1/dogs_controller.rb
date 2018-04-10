class Api::V1::DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render json: @dogs
  end

  def show
    @dog = Dog.find(params[:id])
    render json: @dog
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.valid?
      @dog.save
      render json: @dog
    end
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      render json: @dog
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :imageUrl, :sledId, :isGoodDog)
  end
end
