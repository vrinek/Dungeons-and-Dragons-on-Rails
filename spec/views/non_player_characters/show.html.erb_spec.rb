require 'spec_helper'

describe "non_player_characters/show" do
  let(:npc) { stub_model NonPlayerCharacter, :size => "medium" }

  before do
    assign :non_player_character, npc
  end

  it("renders") { render }
end
