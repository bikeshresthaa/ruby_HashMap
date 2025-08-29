require_relative 'linked_list'

class HashMap
  attr_accessor :capacity, :load_factor, :size, :buckets

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @size = 0
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord}

    hash_code
  end

  def bucket_index(key)
    hash(key) % @capacity
  end

  def set(key, value)
    bucket = get_bucket(key)

    if bucket.find(key)
      bucket.append(key, value)
    else
      bucket.append(key, value)
      @size += 1
      resize if size.to_f / @capacity > @load_factor
    end
  end

  def get_bucket(key)
    index = bucket_index(key)
    @buckets[index]
  end

  def get(key)
    bucket = get_bucket(key)
    bucket.find(key)
  end

  def has?(key)
    bucket = get_bucket(key)
    bucket.contains?(key)
  end

  def remove(key)
    bucket = get_bucket(key)
    if self.has?(key)
      bucket = get_bucket(key)
      @size -= 1
      bucket.remove(key)
    else
      nil
    end
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
  end

  def keys
    @buckets.flat_map { |bucket| bucket.keys}
  end

  def values
    @buckets.flat_map { |bucket| bucket.values }
  end

  def entries
    @buckets.flat_map { |bucket| bucket.entries }
  end

  def resize
    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0

    old_buckets.each do |bucket|
      bucket.each { |node| set(node.key, node.value) }
    end
  end
end