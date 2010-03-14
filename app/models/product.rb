class Product < ActiveRecord::Base
  COMPLEXITIES = %w{simple image_rich complex}

  validates_presence_of :title, :print_isbn, :eisbn, :complexity
  validates_length_of :title, :in => 1..256, :allow_blank => true
  validates_length_of :subtitle, :maximum => 256, :allow_blank => true
  validates_length_of :print_isbn, :in => 13..20, :allow_blank => true
  validates_length_of :eisbn, :in => 13..20, :allow_blank => true
  validates_inclusion_of :complexity, :in => COMPLEXITIES
  
  validates_uniqueness_of :print_isbn, :eisbn
  
  def to_s
    "#{title} [eisbn: #{eisbn.gsub(/-/, '')}]"
  end
  
end
