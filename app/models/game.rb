class Game
  def self.instruction(input)
    steps = input.split("\n").map{|s| s.gsub(/\r/,"").gsub(/\n/,"").strip}.flatten.compact.reject { |e| e.to_s.empty? }
    position = steps.first.gsub('PLACE ', '').split(',')
    return @error = 'Position is not valid' if position.length < 3
    robot = Robot.new(position[0].to_i, position[1].to_i, position[2].upcase)
    steps[1..-2].each do |step|
      robot.command(step)
    end
    if robot.error.present?
      robot.error
    else
      "#{robot.x},#{robot.y},#{robot.direction}"
    end
  end
end