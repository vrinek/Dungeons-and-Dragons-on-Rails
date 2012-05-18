require 'spec_helper'

describe "Insider Data" do
  let(:datum) do
    FactoryGirl.create :insider_datum
  end

  describe "GET /insider_data" do
    before { datum }

    it "works!" do
      get insider_data_path
      response.status.should be(200)
    end
  end
end
