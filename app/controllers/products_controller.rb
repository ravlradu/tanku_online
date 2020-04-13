class ProductsController < ApplicationController
  include Pagy::Backend

  before_action :get_user
  before_action :check_authentication
  before_action :check_admin

  before_action :set_product, only: [:show, :edit, :update, :destroy, :update_visibility]

  layout 'admin'

  # GET /products
  # GET /products.json
  def index
    if params[:search]
      search = ["LOWER(name) like ?", "%#{params[:search].to_s.downcase}%"]
    else
      search = "1=1"
    end
    if params[:c]
      if params[:c].to_i==-1
        ids=[nil]
      elsif params[:c].empty?
        @pagy,@products = pagy(Product.where(search),size:[1,2,2,1])
      else
        category  = Category.where(id: params[:c]).first
        ids       = [category.id] + category.subcategories.pluck(:id)
      end
      @pagy,@products = pagy(Product.where(search).where(category_id: ids),size:[1,2,2,1])
    else
      @pagy,@products = pagy(Product.where(search),size:[1,2,2,1])
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_visibility
    @product.update(is_visible:!@product.is_visible)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:promo, :old_price,:name, :description, :category_id, :is_visible, :price, :available_count, :image)
    end
end
