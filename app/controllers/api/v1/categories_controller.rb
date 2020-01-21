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

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
