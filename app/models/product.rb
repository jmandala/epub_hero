class Product < ActiveRecord::Base
  
  module COMPLEXITIES
    SIMPLE = :simple
    IMAGE_RICH = :image_rich
    COMPLEX = :complex
    
    ALL = [SIMPLE, IMAGE_RICH, COMPLEX]
    ALL.freeze
  end
  COMPLEXITIES.freeze
  
  validates_presence_of :title, :print_isbn, :eisbn, :complexity
  validates_length_of :title, :in => 1..256, :allow_blank => true
  validates_length_of :subtitle, :maximum => 256, :allow_blank => true
  validates_length_of :print_isbn, :in => 13..20, :allow_blank => true
  validates_length_of :eisbn, :in => 13..20, :allow_blank => true
 # validates_inclusion_of :complexity, :in => COMPLEXITIES::ALL
  
  validates_uniqueness_of :print_isbn, :eisbn
  
  def to_s
    "#{title} [eisbn: #{eisbn.gsub(/-/, '')}]"
  end

  def to_param
    @__to_param = nil if title_changed? # clear the cached value if title has changed
    @__to_param ||= begin               # read cached value or recalculate slug
      "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}".squeeze('-')[0..19]
    end
  end
  
  def self.getComplexity(c)
    case c
    when 'simple'
      return COMPLEXITIES::SIMPLE
    when 'image_rich'
      return COMPLEXITIES::IMAGE_RICH
    when 'complex'
      return COMPLEXITIES::COMPLEX
    end
        
  end
end
