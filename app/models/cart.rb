class Cart
  attr_reader :contents

  def initialize(cart_session)
    @contents = cart_session || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add(song_id)
    @contents[song_id.to_s] ||= 0
    @contents[song_id.to_s] += 1
  end
end
