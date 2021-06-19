class Robot
  attr_accessor :x, :y, :direction, :error
  
  def initialize(x, y, direction)
    check_valid_position_and_command(x, y)
    @x, @y, @direction = x, y, direction
    set_direction
  end
  
  def check_direction(command)
    current_direction = DIRECTION[@direction]
    turn = command == "RIGHT" ? 90 : -90
    new_direction = current_direction + turn
    new_direction = 270 if new_direction < 0
    new_direction = 0 if new_direction > 270
    @direction = DIRECTION.key(new_direction)
  end

  def move(x, y)
    set_direction
    @x = @x + x * @set_direction_x
    @y = @y + y * @set_direction_y
    check_valid_position_and_command(@x, @y)
  end
  
  def command(command)
    if ['LEFT', 'RIGHT'].include?(command)
      check_direction(command) and return
    end
    if command == 'MOVE'
      move(1, 1) and return
    end
  end

  def set_direction
    @set_direction_x = COORDINATES[@direction][0]
    @set_direction_y = COORDINATES[@direction][1]
  end

  def check_valid_position_and_command(x, y)
    unless VALID_POSITION.include?(x) && VALID_POSITION.include?(y)
      @error = "Position is not valid or Command is out of range"
    end
  end
end