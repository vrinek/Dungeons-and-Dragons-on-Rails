require 'spec_helper'

describe Character do
  describe "#level_bonus" do
    it "is +5 for level 11" do
      Character.new(level: 11).level_bonus.should == 5
    end

    it "is +2 for level 4" do
      Character.new(level: 4).level_bonus.should == 2
    end

    it "is 0 for level 1" do
      Character.new(level: 1).level_bonus.should == 0
    end

    it "is +12 for level 25" do
      Character.new(level: 25).level_bonus.should == 12
    end
  end

  describe "#bloodied_hp" do
    it "is 15 for 31 HP" do
      Character.new(health_points: 31).bloodied_hp.should == 15
    end

    it "is 2 for 4 HP" do
      Character.new(health_points: 4).bloodied_hp.should == 2
    end

    it "is 17 for 34 HP" do
      Character.new(health_points: 34).bloodied_hp.should == 17
    end

    it "is 5 for 11 HP" do
      Character.new(health_points: 11).bloodied_hp.should == 5
    end
  end

  describe "#check" do
    it "is level bonus + ability modifier" do
      character = Character.new
      character.stub(level_bonus: 4, marklar: AbilityScore.new(12))

      # +4 (level bonus) +1 (ability modifier)
      character.check(:marklar).should == 5
    end

    it "calls dexterity for initiative" do
      character = Character.new
      character.should_receive(:send).with(:dexterity).
        and_return(AbilityScore.new(10))

      character.check :initiative
    end
  end

  describe "fortitude" do
    it "is calculated from maximum of strength and constitution" do
      Character.new(strength: 12, constitution: 16).fortitude.should == 13
      Character.new(strength: 12, constitution: 10).fortitude.should == 11
    end
  end

  describe "reflex" do
    it "is calculated from maximum of dexterity and intelligence" do
      Character.new(dexterity: 12, intelligence: 16).reflex.should == 13
      Character.new(dexterity: 12, intelligence: 10).reflex.should == 11
    end
  end

  describe "will" do
    it "is calculated from maximum of wisdom and charisma" do
      Character.new(wisdom: 12, charisma: 16).will.should == 13
      Character.new(wisdom: 12, charisma: 10).will.should == 11
    end
  end

  describe "roll_initiative" do
    it "returns an initiative roll" do
      FactoryGirl.create(:character).roll_initiative.should be_a(Fixnum)
    end
  end
end
