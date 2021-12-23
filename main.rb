require_relative 'tree'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
p array.uniq!
bst = Tree.new(array)
# 5.times do
#   a = rand(100..150)
#   p bst.insert(a)
#   puts "Inserted #{a} to tree."
# end
bst.pretty_print
bst.delete(324)
puts "Deleted 324 from tree."
bst.pretty_print
value = 6345
find_node = bst.find(value)
if find_node.nil? 
  puts "#{value} is not in the tree" 
else 
  puts "#{value} is in the tree"
end

puts 'Level order traversal: '
puts bst.level_order
