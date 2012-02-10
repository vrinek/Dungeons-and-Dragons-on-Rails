require 'spec_helper'

describe "Characters" do
  describe "GET /characters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get characters_path
      response.status.should be(200)
    end
  end
end
