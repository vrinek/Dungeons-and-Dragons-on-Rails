require 'spec_helper'

describe "non_player_characters/show" do
  let(:race) { CharacterRace.create name: "Human" }

  let(:npc) {
    stub_model NonPlayerCharacter, size: "medium", character_race: race
  }

  before do
    assign :non_player_character, npc
  end

  it("renders") { render }
end
