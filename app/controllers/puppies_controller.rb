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

  end

  def update

  end

  def delete

  end
end
