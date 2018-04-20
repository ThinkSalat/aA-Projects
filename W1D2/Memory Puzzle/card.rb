class Card
  attr_accessor :value, :hidden
  def initialize(value)
    @value = value
    @hidden = true
  end

  def hide
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def to_s
    if @hidden
      "_"
    else
      @value
    end
  end

  def ==(card)
    @value == card.value
  end

end
