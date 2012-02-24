require 'spec_helper'

describe AbilityScore do
  context "methods for MongoMapper" do
    specify { AbilityScore.new("4").to_i.should == 4 }

    specify { AbilityScore.should respond_to(:from_mongo) }
    specify { AbilityScore.should respond_to(:to_mongo) }
  end

  context "modifiers" do
    specify "the modifier for 12 is +1" do
      AbilityScore.new(12).modifier.should == 1
    end

    specify "the modifier for 6 is -2" do
      AbilityScore.new(6).modifier.should == -2
    end

    specify "the modifier for 11 is 0" do
      AbilityScore.new(11).modifier.should == 0
    end

    specify "the modifier for 15 is +2" do
      AbilityScore.new(15).modifier.should == 2
    end
  end

  context "delegation" do
    it "delegates any method given to the value passed at initialization " do
      value = mock(:value)
      value.stub(:to_i => value)

      score = AbilityScore.new(value)

      value.should_receive(:something).with(:anything)
      score.something(:anything)
    end
  end
end
