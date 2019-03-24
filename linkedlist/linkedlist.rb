class Node
  attr_accessor :value, :pointer
  def initialize(params)
    @value = params[:value]
    @pointer = params[:pointer]
  end
end

class LinkedLists
  attr_accessor :header
  def initialize value
    @header = Node.new(value: value, pointer: nil)
  end


  def add value
    new_node = Node.new(value: value, pointer: nil)
    if @header.pointer.nil?
      @header.pointer = new_node
    else
     @tail.pointer = new_node 
    end
    @tail = new_node
  end

  def reverse
    current_node = @header
    #puts current_node.pointer.value
    next_node = nil
    prevoius_node = nil
    puts "current: "+ current_node.pointer.value.to_s
   
    if current_node.nil?
      'it is nil'
    else
      while !current_node.pointer.nil?
        previous_node = current_node.pointer
        next_node = current_node.pointer
        current_node = prevoius_node
      end
    end


    #@header = current_node
  end

  def display
    current_node = @header
    while  !current_node.pointer.nil?
      puts current_node.value.to_s+"\n"
      current_node = current_node.pointer
    end
    puts @tail.value
  end
end

l = LinkedLists.new(10)
l.add(20)
#l.add(30)
#l.add(40)
#l.display
l.reverse
#p l.header.value
#p l.header.pointer.value
l.display
