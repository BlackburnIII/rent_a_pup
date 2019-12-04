class PuppiesController < ApplicationController
  def index
    @puppies = policy_scope(Puppy.all)
  end

  def show
    @puppy = Puppy.find(params[:id])
    authorize @puppy
  end

  def new

    @puppy = Puppy.new
    authorize @puppy
    @user = current_user
  end

  def create
      @puppy = Puppy.new(puppy_params)
      authorize @puppy
      @user = current_user
      @puppy.user = @user
      if @puppy.save
        redirect_to puppy_path(@puppy)
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

    redirect_to puppy_path(@puppy)
  end

  def delete

  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :birthdate, :breed)

  end
end
