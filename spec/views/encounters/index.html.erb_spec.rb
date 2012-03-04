require 'spec_helper'

describe "encounters/index" do
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

  it("works!") { render }
end
