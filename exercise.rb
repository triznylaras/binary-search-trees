require_relative 'tree'

# Driver script

array = Array.new(15) { rand(1..100) }
bst = Tree.new(array)

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Level order traversal: '
puts bst.level_order_rec

puts 'Preorder traversal: '
puts bst.preorder

puts 'Inorder traversal: '
puts bst.inorder

puts 'Postorder traversal: '
puts bst.postorder

10.times do
  a = rand(100..150)
  bst.insert(a)
  puts "Inserted #{a} to tree."
end

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Rebalancing tree...'
bst.rebalance

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Level order traversal: '
puts bst.level_order_rec

puts 'Preorder traversal: '
puts bst.preorder

puts 'Inorder traversal: '
puts bst.inorder

puts 'Postorder traversal: '
puts bst.postorder
