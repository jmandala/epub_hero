Factory.define :product do |p|
  p.title "This is the product title"
  p.subtitle ""
  p.print_isbn "978-123456-789-0"
  p.eisbn "978-123456-6789-3"
  p.complexity Product::COMPLEXITIES.first
end