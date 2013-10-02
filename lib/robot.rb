class Robot
  attr_reader :x, :y, :direction, :limit_x, :limit_y

  DIRECTIONS = [:N, :E, :S, :W]

  def initialize x, y, direction, limit_x, limit_y
    @x = x.to_i
    @y = y.to_i
    @direction = direction.to_sym
    @limit_x = limit_x.to_i
    @limit_y = limit_y.to_i
  end

  def left
    @direction = DIRECTIONS[DIRECTIONS.index(@direction) - 1]
  end

  def right
    @direction = (DIRECTIONS*2)[DIRECTIONS.index(@direction) + 1]
  end

  def move
    case @direction
    when :N
      return false if @y == @limit_y
      @y += 1
    when :E
      return false if @x == @limit_x
      @x += 1
    when :S
      return false if @y == 0
      @y -= 1
    when :W
      return false if @x == 0
      @x -= 1
    end

    true
  end

  def teleport x, y
    return false if valid_position?(x, y)

    @x = x
    @y = y

    true
  end

  def to_s
    "#{@x} #{@y} #{@direction}"
  end

  private

  def valid_position? x, y
    x < 0 || x > @limit_x || y < 0 || y > @limit_y
  end
end
