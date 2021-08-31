class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id]) ###
  end

  def new
    @product = Product.new 
  end

  def create
    #product_params[:user_id] = current_user.id
    @product = Product.create(title: product_params[:title], image: product_params[:image], description: product_params[:description], price: product_params[:price], user_id: current_user.id)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id]) ###
  end

  def update
    @product = Product.find(params[:id]) ###

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id]) ###
    @product.destroy ### if else
    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :image, :description, :price, current_user.id)
    end
end
