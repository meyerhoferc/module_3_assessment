class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 201
    end
  end

  def destroy
    Item.delete(params[:id])
    render nothing: true, status: 204
  end

  private

  def item_params
    if params[:item]
      params.require(:item).permit(:name, :description, :image_url)
    else
      params.permit(:name, :description, :image_url)
    end
  end
end
