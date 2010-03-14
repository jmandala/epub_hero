Factory.sequence :isbn do |n|
  "978-123456-#{'%03d' % n}-0"
end

Factory.define :product do |p|
  p.title "This is the product title"
  p.subtitle ""
  p.print_isbn {Factory.next :isbn}
  p.eisbn {Factory.next :isbn}
  p.complexity Product::COMPLEXITIES::ALL.rand
end