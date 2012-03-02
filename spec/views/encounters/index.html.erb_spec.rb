require 'spec_helper'

describe "encounters/index.html.erb" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter,
        :name => "Name",
        :npcs => ""
      ),
      stub_model(Encounter,
        :name => "Name",
        :npcs => ""
      )
    ])
  end

  it "renders a list of encounters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
