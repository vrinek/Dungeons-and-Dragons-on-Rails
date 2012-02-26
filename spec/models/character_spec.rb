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
end
