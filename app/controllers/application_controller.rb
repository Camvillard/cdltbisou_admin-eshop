class Api::V1::ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
