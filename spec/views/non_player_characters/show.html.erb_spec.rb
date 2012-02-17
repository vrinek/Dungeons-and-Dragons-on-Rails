require 'spec_helper'

describe "non_player_characters/show" do
  before(:each) do
    @non_player_character = assign(:non_player_character, stub_model(NonPlayerCharacter))
  end

  it "renders attributes in <p>" do
    render
  end
end
