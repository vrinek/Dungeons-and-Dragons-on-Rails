require 'spec_helper'

describe "non_player_characters/new" do
  before(:each) do
    assign(:non_player_character, stub_model(NonPlayerCharacter).as_new_record)
  end

  it "renders new non_player_character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => non_player_characters_path, :method => "post" do
    end
  end
end
