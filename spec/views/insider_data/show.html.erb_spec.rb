require 'spec_helper'

describe "insider_data/show" do
  before(:each) do
    @insider_datum = assign(:insider_datum, stub_model(InsiderDatum,
      :original_id => 1,
      :name => "Name",
      :html => "Html",
      :data_type => "Data Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Html/)
    rendered.should match(/Data Type/)
  end
end
