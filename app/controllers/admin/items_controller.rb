class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@items = Item.all
  end

  def new
	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    @item.save
  	redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def top
  end

  private
  def item_params
  	params.require(:item).permit(:name, :introduction, :price, :image, :sale_status, :genre_id)
  end

end