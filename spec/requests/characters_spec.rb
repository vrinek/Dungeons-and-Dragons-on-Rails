require 'spec_helper'

describe "Characters" do
  describe "GET /characters" do
    before(:each) do
      FactoryGirl.create_list(:player, 2)
      FactoryGirl.create_list(:npc, 5)
    end

    it "works!" do
      get characters_path
      response.status.should be(200)
    end
  end
end
