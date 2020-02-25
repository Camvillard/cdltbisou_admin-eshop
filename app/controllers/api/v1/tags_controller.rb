class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    tags = Tag.all
    render json: tags
  end

  def show
    render json: @tag, include: :products
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save!
      render json: @tag, status: :created, location: api_v1_tag_url(@tag)
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
   if @tag.update(product_params)
    render json: @tag
   else
    render json: @tag.errors, status: :unprocessable_entity
   end
  end

  def destroy
    @tag.destroy
    # render status: 200
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

    def tag_params
    params.require(:tag).permit(:name, :slug)
  end

end
