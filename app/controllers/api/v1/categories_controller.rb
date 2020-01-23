class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category, include: :products
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      render json: @category, status: :created, location: api_v1_category_url(@category)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
   if @category.update(product_params)
    render json: @category
   else
    render json: @category.errors, status: :unprocessable_entity
   end
  end

  def destroy
    @category.destroy
    render status: 200
    # render json: Category.all, status: 200
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
