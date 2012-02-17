require 'spec_helper'

describe "non_player_characters/index" do
  before(:each) do
    assign(:non_player_characters, [
      stub_model(NonPlayerCharacter),
      stub_model(NonPlayerCharacter)
    ])
  end

  it "renders a list of non_player_characters" do
    render
  end
end
