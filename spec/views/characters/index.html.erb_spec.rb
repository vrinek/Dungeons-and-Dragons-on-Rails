require 'spec_helper'

describe "characters/index" do
  before(:each) do
    assign(:characters, [
      stub_model(Character),
      stub_model(Character)
    ])
  end

  it "works!" do
    render
  end
end
