require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  context 'a product' do
    setup do
      @product = Factory(:product)
      
    end
    
    subject { @product }
    
    should_validate_presence_of :title, :print_isbn, :eisbn, :complexity
    should_validate_uniqueness_of :print_isbn, :eisbn
    should_ensure_length_in_range :title, 1..256, :short_message => /blank|empty/
    should_ensure_length_in_range :print_isbn, 13..20
    should_ensure_length_in_range :eisbn, 13..20
    should_allow_values_for :complexity, *Product::COMPLEXITIES
    should_not_allow_values_for :complexity, %{foo bar baz}
    
  end
    
end
