require 'spec_helper'

describe "NonPlayerCharacters" do
  let(:npc) do
    FactoryGirl.create :npc
  end

  describe "GET /non_player_characters/:id" do
    it "works!" do
      get non_player_character_path(npc)
      response.status.should be(200)
    end
  end

  describe "GET /non_player_characters/new" do
    it "works!" do
      get new_non_player_character_path
      response.status.should be(200)
    end
  end
end
