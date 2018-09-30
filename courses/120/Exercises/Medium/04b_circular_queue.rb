class CircularQueue
  def initialize(max_size)
    @buffer = [nil] * max_size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end
    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end
  
  private

  def increment(position)
    (position + 1) % @buffer.max_size
  end
end
