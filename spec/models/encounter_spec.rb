require 'spec_helper'

describe Encounter do
  subject { FactoryGirl.create(:encounter, :with_npcs) }

  it { should respond_to(:explain_npcs) }
  it { should respond_to(:count_of) }
  it { should respond_to(:roll_initiative) }

  its(:roll_initiative) { should be_a(Hash) }

  describe "total_xp" do
    subject { FactoryGirl.create(:encounter) }

    let!(:minion) { FactoryGirl.create(:npc, xp_value: 24) }
    let!(:leader) { FactoryGirl.create(:npc, xp_value: 140) }

    context "on an empty encounter" do
      its(:total_xp) { should == 0 }
    end

    context "on an encounter with 2 minions worth 50 XP each" do
      before(:each) do
        subject.npc_counts[minion.id.to_s] = 2
      end

      its(:total_xp) { should == 48 }
    end

    context "on an encounter with 5 minions worth 24 XP each and a leader worth 140 XP" do
      before(:each) do
        subject.npc_counts[minion.id.to_s] = 5
        subject.npc_counts[leader.id.to_s] = 1
      end

      its(:total_xp) { should == 260 }
    end
  end
end
