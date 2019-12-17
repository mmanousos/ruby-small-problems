require 'pry'
class Bst
  attr_reader :primary
  attr_accessor :element, :tree

  def initialize(*parent)
    @primary = determine_primary(parent)
    @tree = determine_tree(parent, @primary)
  end

  def data
    primary
  end

  # def insert(new_value)
  #   node = [nil, new_value, nil]
  #   begin_index = determine_index(new_value)
  # # binding.pry
  #   # if new_value is <= @primary, start at 0
  #   # else start at index of @primary + 1
  #   tree.each_with_index do |value, index|
  # binding.pry
  #     next if value.nil? || index < begin_index
  #     value_to_check = comparison_value(value)
  # binding.pry
  #     if new_value <= value_to_check
  #   binding.pry
  #       is_array?(value) ? value[0] = node : tree[index - 1] = node
  #     # index == 0 ? tree[index] = node : tree[index - 1] = node
  #     # get the index of the comparison value and insert node next to that
  #       break
  #     else
  #   binding.pry
  #       is_array?(value) ? value[2] = node : tree[index + 1] = node
  #       if value is an array ? value[2] = node
  #         if index + 1 is an array
  #
  #       # tree[index + 1] = node
  #       break
  #     end
  #   end
  # end

  def insert(new_value)
    node = [nil, new_value, nil]
    starting_index = determine_index(new_value)
    tree.each_with_index do |value, index|
      next if value.nil? || index < starting_index
    binding.pry
      value = find_child(new_value, value) if is_array?(value)
      comparison_value = comparison_value(value)
    binding.pry
      if new_value <= comparison_value
        index == 0 ? value[0] = node : tree[index - 1] = node
        break
      else
        tree[index + 1] = node
        break
      end
    end
  end


  def find_child(new_value, current_tree)
    current_tree.each_with_index do |value, index|
      next if value.nil?
      if is_array?(value)
        find_child(new_value, value)
      end
      center = current_tree[1]
      if new_value <= center
        current_tree
      else
        break
      end
    end
  end


  # def find_and_insert(new_value, node, tree, starting_index)
  # binding.pry
  #   tree.each_with_index do |value, index|
  #     next if value.nil? || index < starting_index
  #     if is_array?(value)
  #       find_and_insert(new_value, node, value, starting_index)
  #     end
  #     center = tree[1]
  #     if new_value <= center
  #     # binding.pry
  #       tree[0] = node
  #       break
  #     else
  #       tree[2] = node
  #       break
  #     end
  #   end
  # end

# create a new Bst with the child node for the primary
  def left
    Bst.new(tree[tree.index(primary)-1])
  end

  def right
    Bst.new(tree[tree.index(primary)+1])
  end

  private

  def determine_primary(parent)
    parent.flatten!
    parent.size == 1 ? parent[0] : parent[1]
  end

  def determine_tree(parent, primary)
    parent.flatten!
    parent.size == 1 ? [nil, primary, nil] : parent
  end

  def determine_index(new_value)
    new_value > primary ? tree.index(primary) : 0
  end

  def is_array?(value)
    value.class == Array
  end

  def comparison_value(value)
    is_array?(value) ? value[1] : value
  end
end
