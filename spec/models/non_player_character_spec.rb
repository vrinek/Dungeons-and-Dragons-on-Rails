require 'spec_helper'

describe NonPlayerCharacter do
  it "understands character role" do
    NonPlayerCharacter.new(character_role: "Minion")
  end

  it "understands xp value" do
    NonPlayerCharacter.new(xp_value: 100)
  end

  describe "fortitude" do
    it "is calculated from maximum of strength and constitution" do
      NonPlayerCharacter.new(strength: 12, constitution: 16).fortitude.
        should == 13

      NonPlayerCharacter.new(strength: 12, constitution: 10).fortitude.
        should == 11
    end

    it "can be overwritten" do
      npc = NonPlayerCharacter.new(strength: 12, constitution: 16)
      npc.fortitude = 5

      npc.fortitude.should == 5
    end
  end

  describe "reflex" do
    it "is calculated from maximum of dexterity and intelligence" do
      NonPlayerCharacter.new(dexterity: 12, intelligence: 16).reflex.
        should == 13

      NonPlayerCharacter.new(dexterity: 12, intelligence: 10).reflex.
        should == 11
    end

    it "can be overwritten" do
      npc = NonPlayerCharacter.new(dexterity: 12, intelligence: 16)
      npc.reflex = 5

      npc.reflex.should == 5
    end
  end

  describe "will" do
    it "is calculated from maximum of wisdom and charisma" do
      NonPlayerCharacter.new(wisdom: 12, charisma: 16).will.
        should == 13

      NonPlayerCharacter.new(wisdom: 12, charisma: 10).will.
        should == 11
    end

    it "can be overwritten" do
      npc = NonPlayerCharacter.new(wisdom: 12, charisma: 16)
      npc.will = 5

      npc.will.should == 5
    end
  end
end
