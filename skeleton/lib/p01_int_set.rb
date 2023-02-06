class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max)
  end
 
  def insert(num)
    raise 'Out of bounds' if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true
    return false if @store[num] == false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  # attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
  end

  def include?(num)
  end
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    return @store[i]
  end
  
  private
  

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
