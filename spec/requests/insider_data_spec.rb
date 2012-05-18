require 'spec_helper'

describe "Insider Data" do
  describe "GET /insider_data" do
    it "works!" do
      get insider_data_path
      response.status.should be(200)
    end
  end
end
