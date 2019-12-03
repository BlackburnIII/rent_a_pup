class PuppiesController < ApplicationController
  def index
    @puppies = policy_scope(Puppy.all)
  end

  def show
    @puppy = Puppy.find(params[:id])
    authorize @puppy
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end
end
