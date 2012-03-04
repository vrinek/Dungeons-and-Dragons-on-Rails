require 'spec_helper'

describe "encounters/new" do
  before do
    assign(:encounter, stub_model(Encounter,
      :name => "MyString",
      :npcs => ""
    ).as_new_record)
  end

  it "renders new encounter form" do
    render

    assert_select "form", :action => encounters_path, :method => "post" do
      assert_select "input#encounter_name", :name => "encounter[name]"
    end
  end
end
