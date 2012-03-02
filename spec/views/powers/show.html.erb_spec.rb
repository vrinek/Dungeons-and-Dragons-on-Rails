require 'spec_helper'

describe "powers/show.html.erb" do
  before(:each) do
    @power = assign(:power, stub_model(Power,
      :name => "Name",
      :description => "Description",
      :requirement => "Requirement",
      :trigger => "Trigger",
      :attack => "Attack",
      :hit => "Hit",
      :miss => "Miss",
      :effect => "Effect"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Requirement/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trigger/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attack/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Miss/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Effect/)
  end
end
