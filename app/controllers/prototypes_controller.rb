class PrototypesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @prototype = Prototype.includes(:comments).find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end


  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def ensure_correct_user
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end
end