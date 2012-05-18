require 'spec_helper'

describe "Combat" do
  describe "GET /combat/initiative" do
    it "works!" do
      get initiative_path
      response.status.should be(200)
    end
  end
end
