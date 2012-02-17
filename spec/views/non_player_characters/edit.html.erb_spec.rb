require 'spec_helper'

describe "non_player_characters/edit" do
  before(:each) do
    @non_player_character = assign(:non_player_character, stub_model(NonPlayerCharacter))
  end

  it "renders the edit non_player_character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => non_player_characters_path(@non_player_character), :method => "post" do
    end
  end
end
