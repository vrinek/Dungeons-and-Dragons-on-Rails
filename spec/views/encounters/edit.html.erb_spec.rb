require 'spec_helper'

describe "encounters/edit.html.erb" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :name => "MyString",
      :npcs => ""
    ))
  end

  it "renders the edit encounter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => encounters_path(@encounter), :method => "post" do
      assert_select "input#encounter_name", :name => "encounter[name]"
      assert_select "input#encounter_npcs", :name => "encounter[npcs]"
    end
  end
end
