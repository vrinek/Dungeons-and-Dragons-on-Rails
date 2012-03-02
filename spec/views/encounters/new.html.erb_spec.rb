require 'spec_helper'

describe "encounters/new.html.erb" do
  before(:each) do
    assign(:encounter, stub_model(Encounter,
      :name => "MyString",
      :npcs => ""
    ).as_new_record)
  end

  it "renders new encounter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => encounters_path, :method => "post" do
      assert_select "input#encounter_name", :name => "encounter[name]"
      assert_select "input#encounter_npcs", :name => "encounter[npcs]"
    end
  end
end
