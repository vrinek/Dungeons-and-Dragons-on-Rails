require 'spec_helper'

describe "character_races/index" do
  before(:each) do
    assign(:character_races, [
      stub_model(CharacterRace,
        :name => "Name"
      ),
      stub_model(CharacterRace,
        :name => "Name"
      )
    ])
  end

  it "renders a list of character_races" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
