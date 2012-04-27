require 'spec_helper'

describe "insider_data/index" do
  before(:each) do
    assign(:insider_data, [
      stub_model(InsiderDatum,
        :original_id => 1,
        :name => "Name",
        :html => "Html",
        :data_type => "Data Type"
      ),
      stub_model(InsiderDatum,
        :original_id => 1,
        :name => "Name",
        :html => "Html",
        :data_type => "Data Type"
      )
    ])
  end

  it "renders a list of insider_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Html".to_s, :count => 2
    assert_select "tr>td", :text => "Data Type".to_s, :count => 2
  end
end
