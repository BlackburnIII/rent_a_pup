class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
  end

  def show
    @puppy = Puppy.find(params[:id])
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.new(puppy_params)
    if @Puppy.save
      redirect_to @puppy
    else
      render :new
    end
  end

  def edit
    @puppy = Puppy.find(params[:id])
  end

  def update
    @puppy = Puppy.find(params[:id])
    @puppy.update(puppy_params)
  end

  def delete
    @puppy = Puppy.find(params[:id])
    @puppy.destroy
  end

  private

  def puppy_params
    params.require(:puppies).permit(:name, :breed, :birthdate)
  end
end
