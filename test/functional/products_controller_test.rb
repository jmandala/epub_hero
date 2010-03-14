require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup 
    @product = Factory(:product)
  end
  
  context 'A GET to Products#index' do
    setup {get :index}
    should_respond_with :success
    should_assign_to(:products) { [@product]}
    should_render_template :index
    should_not_set_the_flash
  end
  
  context 'a POST to Products#create with all required attributes' do
    setup { post :create, :product  => Factory.attributes_for(:product) }
    should_redirect_to('Products#show') { products_path }
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
