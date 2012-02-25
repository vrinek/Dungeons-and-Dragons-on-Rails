require 'spec_helper'

describe "character_races/edit" do
  before(:each) do
    @character_race = assign(:character_race, stub_model(CharacterRace,
      :name => "MyString"
    ))
  end

  it "renders the edit character_race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_races_path(@character_race), :method => "post" do
      assert_select "input#character_race_name", :name => "character_race[name]"
    end
  end
end
