require 'spec_helper'

describe "encounters/show.html.erb" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :name => "Name",
      :npcs => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
