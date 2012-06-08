require 'spec_helper'

describe "combat/initiative" do
  it("works!") { render }

  context "with an encounter" do
    let(:encounter) { FactoryGirl.build(:encounter, :with_npcs) }

    before(:each) do
      assign(:encounter, encounter)
    end

    it("works!") { render }
  end
end
