class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
  end

  def show
    @puppy = Puppy.find params[:id]
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.new puppy_params
    if @puppy.save
      redirect_to "/puppies"
    else
      render :new
    end
  end

  def edit
    @puppy = Puppy.find params[:id]
  end

  def update
    @puppy = Puppy.find params[:id]
    if @puppy.update_attributes puppy_params
      redirect_to "/puppies/#{@puppy.id}"
    else
      render :edit
    end
  end

  def destroy
    puppy = Puppy.find params[:id]
    puppy.destroy
    redirect_to "/puppies"
  end

  private
  def puppy_params  # this is called "white params" also "strong params"
    params.require(:puppy).permit(:name, :age, :breed)
  end
end
