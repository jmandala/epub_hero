class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  def show(product = nil)
    @product ||= Product.find(params[:id])
  end

  def new(product = nil)
    @product = product || Product.new
    render :action => :new
  end

  def create
    @product ||= Product.new(params[:product])
    
    if @product.save
      logger.info "CREATE PRODUCT: #{@product.id}"
      flash[:success] = "Created title #{@product.title}"
      redirect_to @product
    else
      self.new @product
    end
  end

end
