class GamesController < ApplicationController

  def index
    input_value = params[:input]
    @result = Game.instruction(input_value) if input_value
  end
end