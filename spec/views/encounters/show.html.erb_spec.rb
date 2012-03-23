require 'spec_helper'

describe "encounters/show" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :name => "Name",
      :npcs => [stub_model(NonPlayerCharacter, :id => '67', :size => 'Uber', :character_race => stub_model(CharacterRace))],
      :npc_counts => {'67' => 2}
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
