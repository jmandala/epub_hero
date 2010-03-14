require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  context 'a product' do
    setup do
      @product = Factory(:product, 
                  :title => "The Art of War", 
                  :eisbn => "978-1234-56789-0")
    end
    
    subject { @product }
    
    should_allow_mass_assignment_of :title, :print_isbn, :eisbn, :complexity
    should_validate_presence_of :title, :print_isbn, :eisbn, :complexity
    should_validate_uniqueness_of :print_isbn, :eisbn
    should_ensure_length_in_range :title, 1..256, :short_message => /blank|empty/
    should_ensure_length_in_range :print_isbn, 13..20
    should_ensure_length_in_range :eisbn, 13..20
    should_allow_values_for :complexity, *Product::COMPLEXITIES::ALL
    should_not_allow_values_for :complexity, %{foo bar baz}

    should 'have a sane to_s' do
      assert_equal "The Art of War [eisbn: 9781234567890]", @product.to_s
    end
    
    
  end
    
end
