class PuppiesController < ApplicationController
  def index
    @puppies = policy_scope(Puppy.all)
  end

  def show

  end

  def new

  end

  def create

  end

  def edit
    @puppy = Puppy.find(params[:id])
  end

  def update
    @puppy = Puppy.find(params[:id])
    @puppy.update(puppy_params)

    redirect_to puppy_path(@puppy)
  end

  def delete

  end
end
