class Array
  def my_each(&prc)
    prc ||= proc { |el| el }
      self.length.times do |i|
        prc.call(self[i])
      end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |el|
      rejected << el if !prc.call(el)
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_flatten
    return self if self.none? {|el| el.is_a? Array}
    flattened = []
    self.my_each do |el|
      if el.is_a? Array
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*args)
    zip = []
    self.length.times do |i|
        zip_arr = [self[i]]
      args.each do |arr|
        zip_arr << arr[i]
      end
      zip << zip_arr
    end
    zip
  end

  def my_rotate(n = 1)
    n = n % length
    self[n..-1] + self[0...n]
  end


  def my_join(sep='')
    result = ''
    each_with_index do |el,idx|
      if idx == length-1
        result << el.to_s
      else
        result << el.to_s + sep.to_s
      end
    end
    result
  end

  def my_reverse
    reversed = []
    (length-1).downto(0) do |i|
      reversed << self[i]
    end
    reversed
  end

end
