require 'spec_helper'

describe "powers/index.html.erb" do
  before(:each) do
    assign(:powers, [
      stub_model(Power,
        :name => "Name",
        :description => "Description",
        :requirement => "Requirement",
        :trigger => "Trigger",
        :attack => "Attack",
        :hit => "Hit",
        :miss => "Miss",
        :effect => "Effect"
      ),
      stub_model(Power,
        :name => "Name",
        :description => "Description",
        :requirement => "Requirement",
        :trigger => "Trigger",
        :attack => "Attack",
        :hit => "Hit",
        :miss => "Miss",
        :effect => "Effect"
      )
    ])
  end

  it "renders a list of powers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Requirement".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trigger".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Attack".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Miss".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Effect".to_s, :count => 2
  end
end
