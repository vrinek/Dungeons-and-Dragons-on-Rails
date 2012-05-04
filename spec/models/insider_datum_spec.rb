require 'spec_helper'

describe InsiderDatum do
  context "when a matching datum already exists" do
    let(:type) { "a type" }
    let(:id) { 42 }

    let!(:existing) do
      FactoryGirl.create :insider_datum, data_type: type, original_id: id
    end

    it "should not hit Ravenloft" do
      Ravenloft::Manager.any_instance.should_not_receive(:login!)

      InsiderDatum.fetch(type, id)
    end
  end

  context "when no matching datum exists" do
    let(:type) { "a type" }
    let(:id) { 42 }

    it "should hit Ravenloft" do
      Ravenloft::Manager.any_instance.should_receive(:login!)
      page = mock(:nokogiri_page, to_html: "some html")
      Ravenloft::Manager.any_instance.should_receive(:get).and_return(page)

      InsiderDatum.fetch(type, id)
    end

    it "should cache the result to the database" do
      Ravenloft::Manager.any_instance.stub(:login!)
      page = mock(:nokogiri_page, to_html: "some html")
      Ravenloft::Manager.any_instance.stub(:get).and_return(page)

      expect {
        InsiderDatum.fetch(type, id)
      }.to change {
        InsiderDatum.count
      }.by(1)
    end
  end
end
