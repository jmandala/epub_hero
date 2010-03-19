require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup 
    @product = Factory(:product)
  end
  
  context 'A GET to Products#index' do
    setup { get :index }
    should_respond_with :success
    should_assign_to(:products) { [@product]}
    should_render_template :index
  end
  
  context 'A GET to Products#new' do
    setup {get :new}
    should_respond_with :success
    should "assign a new Product to :product" do
      p = assigns(:product)
      assert p.present?
      assert p.kind_of?(Product)
      assert p.new_record?
    end
    should_render_template :new
  end
  
  context 'A GET to Products#show' do
    setup {get :show, :id => @product.to_param}
    should_respond_with :success
    should_assign_to(:product) { @product}
    should_render_template :show
  end
  
  
  context 'a POST to Products#create with all required attributes' do
    setup do
      @product = Factory(:product)
      Product.stubs(:new).returns(@product)
      post :create, :product  => { :anything => 'here' }
    end
    should_assign_to :product
    should "assign a valid Product to :product" do
      p = assigns(:product)
      assert p.present?
      assert p.kind_of?(Product)
      assert p.valid?
      assert !p.new_record?
    end
    should_redirect_to('Products#show') { product_path(@product) }
    should_change("the number of Products", :by => 1) { Product.count }
    should_set_the_flash_to /created/i
  end

  
  context 'a POST to Products#create with string value for complexities' do
    setup do
      @product = Factory(:product)
      @product.complexity = Product::COMPLEXITITES::ALL.first.to_s
      Product.stubs(:new).returns(@product)
      post :create, :product  => { :anything => 'here' }
    end
    should_assign_to :product
    should "assign a valid Product to :product" do
      p = assigns(:product)
      assert p.present?
      assert p.kind_of?(Product)
      assert p.valid?
      assert !p.new_record?
    end
    should_redirect_to('Products#show') { product_path(@product) }
    should_change("the number of Products", :by => 1) { Product.count }
    should_set_the_flash_to /created/i
  end


  context 'a POST to Products#create with invalid attributes' do
    setup { post :create, :product => Factory.attributes_for(:product, :eisbn => nil) }
    should_render_template :new
    should_not_change("the number of Products") { Product.count }
    should "assign an invalid Product to :product" do
      p = assigns(:product)
      assert p.present?
      assert p.kind_of?(Product)
      assert !p.valid?
      assert p.new_record?
    end
  end


end
