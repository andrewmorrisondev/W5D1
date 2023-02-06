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

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].pop(num)
  end

  def include?(num)

    store.each do |bucket|
      bucket.each do |el|
        if el == num
          return true
        end
      end
    end

    false

  end
  
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    return @store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet

  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num
      @count += 1
    end
    #check if count >= num
    #t = resize
  end
  
  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end
  
  def include?(num)
    store.each do |bucket|
      bucket.each do |el|
        if el == num
          return true
        end
      end
    end
    
    false
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end
  
  
  def num_buckets
    @store.length
  end
  
  def resize!
    if @count == num_buckets
      self.num_buckets = self.num_buckets * 2
    end
  end
  #create new set w/ new num of buckets
  #put ele into the new set in the correct places
end
