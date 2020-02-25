class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    @product.category = Category.find_by(name: params[:product][:category])
    if @product.save!
      render json: @product, status: :created, location: api_v1_product_url(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
   if @product.update(product_params)
    render json: @product
   else
    render json: @product.errors, status: :unprocessable_entity
   end
  end

  def destroy
    @product.destroy
    render status: 200
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :sku, :photo, :stock, :slug)
  end

end
