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

    assert_select "div.identification", :text => 'Data Type #1', :count => 2
    assert_select "div.details", :text => "Html".to_s, :count => 2
  end
end
