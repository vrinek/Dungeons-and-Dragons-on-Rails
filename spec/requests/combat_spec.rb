require 'spec_helper'

describe "Combat" do
  describe "GET /combat/initiative" do
    context "without an encounter" do
      it "responds with statu 200" do
        get initiative_path

        response.status.should be(200)
      end
    end

    context "with an encounter" do
      let(:encounter) { FactoryGirl.create(:encounter, :with_npcs) }

      it "responds with statu 200" do
        get initiative_path(encounter_id: encounter.id)

        response.status.should be(200)
      end

      it "includes the encoutner's name in the body" do
        get initiative_path(encounter_id: encounter.id)

        response.body.should include(encounter.name)
      end
    end
  end
end
