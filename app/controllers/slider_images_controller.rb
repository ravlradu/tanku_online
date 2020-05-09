class SliderImagesController < ApplicationController
  layout 'admin'
  
  before_action :get_user
  before_action :check_authentication
  before_action :check_admin
  before_action :set_slider, only: [:show, :edit, :update, :destroy]


  def index
    @slider_images = SliderImage.all
  end

  def new
    @slider_image = SliderImage.new
  end

  def create
    @slider_image = SliderImage.new(slider_params)
    if @slider_image.save
      redirect_to action:'index'
    else
    end
  end

  def update
    if @slider_image.update(slider_params)
      redirect_to action:'index'
    else
    end
  end

  def destroy
    @slider_image.destroy
    redirect_to action:'index'
  end


  private

  def set_slider
    @slider_image = SliderImage.find(params[:id])
  end

  def slider_params
    params.require(:slider_image).permit(:image)
  end

end
