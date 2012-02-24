require 'spec_helper'

describe "character_races/new.html.erb" do
  before(:each) do
    assign(:character_race, stub_model(CharacterRace,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new character_race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_races_path, :method => "post" do
      assert_select "input#character_race_name", :name => "character_race[name]"
    end
  end
end
