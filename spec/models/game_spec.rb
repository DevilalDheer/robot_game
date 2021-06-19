require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'check invalid instruction input' do
    expect(Game.instruction('PLACE 6,6')).to eq('Position is not valid')
  end

  it 'check valid instruction input' do
    expect(Game.instruction("PLACE 0,0,NORTH \n MOVE \n REPORT")).to eq("0,1,NORTH")
  end
end
