require 'spec_helper'

describe "NonPlayerCharacters" do
  let(:npc) { NonPlayerCharacter.create name: "Samuel" }

  describe "GET /non_player_characters/:id" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get non_player_character_path(npc)
      response.status.should be(200)
    end
  end
end
