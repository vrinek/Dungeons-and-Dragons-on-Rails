require 'spec_helper'

describe "NonPlayerCharacters" do
  let(:race) { CharacterRace.create name: "Human" }

  let(:npc) {
    NonPlayerCharacter.create name: "Samuel", size: "medium",
      character_race: race
  }

  describe "GET /non_player_characters/:id" do
    it "works!" do
      get non_player_character_path(npc)

      response.status.should be(200)
    end
  end
end
