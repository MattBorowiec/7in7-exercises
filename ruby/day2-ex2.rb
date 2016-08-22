class Tree
	attr_accessor :children, :node_name
	
	def initialize(name, children=[])
		@children = children
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

class ModifiedTree
	attr_accessor :children, :node_name
	
	def initialize(tree)
		if !tree.empty?
			@node_name = tree.keys.first
			@children = []	
			tree[@node_name].each do |k, v|
				@children.push(ModifiedTree.new({k=>v}))
			end
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

tree = Tree.new("Ruby",
	[Tree.new("Java"), Tree.new("Go")])

puts "visit a node"
tree.visit {|node| puts node.node_name }
puts

puts "Entire Tree"
tree.visit_all {|node|puts node.node_name }

puts "hash time"

hash = {'grandpa' => { 'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' =>{}, 'child4' => {}}}} 

hash_tree = ModifiedTree.new(hash)

puts "visit a node"
puts hash_tree.visit {|node| puts node.node_name}
puts

puts "visit all nodes"
puts hash_tree.visit_all {|node| puts node.node_name}
