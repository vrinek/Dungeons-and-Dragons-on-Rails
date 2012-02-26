require 'spec_helper'

describe CharacterRace do
  describe ".for_select" do
    before do
      CharacterRace.create name: "Human"
      CharacterRace.create name: "Goblin"
    end

    it "returns an Array" do
      CharacterRace.for_select.should be_a(Array)
    end

    specify "the Array should have all races" do
      CharacterRace.for_select.should have(2).races
    end

    specify "each Array item should be an Array itself" do
      CharacterRace.for_select.each do |item|
        item.should be_a(Array)
      end
    end

    specify "each Array item should be composed of an id and a name" do
      CharacterRace.for_select.each do |item|
        item.should have(2).parts
        item[0].should be_a(String)
        item[1].should be_a(BSON::ObjectId)
      end
    end
  end
end
