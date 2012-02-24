require 'spec_helper'

describe "character_races/show.html.erb" do
  before(:each) do
    @character_race = assign(:character_race, stub_model(CharacterRace,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
