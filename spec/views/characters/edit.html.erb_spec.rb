require 'spec_helper'

describe "characters/edit" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "MyString",
      :level => 1,
      :strength => 1,
      :constitution => 1,
      :dexterity => 1,
      :intelligence => 1,
      :wisdom => 1,
      :charisma => 1,
      :character_class_code => "MyString",
      :character_race_code => "MyString"
    ))
  end

  it "renders the edit character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characters_path(@character), :method => "post" do
      assert_select "input#character_name", :name => "character[name]"
      assert_select "input#character_level", :name => "character[level]"
      assert_select "input#character_strength", :name => "character[strength]"
      assert_select "input#character_constitution", :name => "character[constitution]"
      assert_select "input#character_dexterity", :name => "character[dexterity]"
      assert_select "input#character_intelligence", :name => "character[intelligence]"
      assert_select "input#character_wisdom", :name => "character[wisdom]"
      assert_select "input#character_charisma", :name => "character[charisma]"
      assert_select "input#character_character_class_code", :name => "character[character_class_code]"
      assert_select "input#character_character_race_code", :name => "character[character_race_code]"
    end
  end
end
