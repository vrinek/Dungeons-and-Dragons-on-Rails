require 'spec_helper'

describe "Encounters" do
  let(:encounter) do
    FactoryGirl.create :encounter, :with_npcs
  end

  describe "GET /encounters" do
    before(:each) do
      FactoryGirl.create_list :encounter, 4
      FactoryGirl.create_list :encounter, 2, :with_npcs
    end

    it "works!" do
      get encounters_path
      response.status.should be(200)
    end
  end

  describe "GET /encounters/:id" do
    it "works!" do
      get encounter_path(encounter)
      response.status.should be(200)
    end
  end

  describe "GET /encounters/:id/edit" do
    it "works!" do
      get edit_encounter_path(encounter)
      response.status.should be(200)
    end
  end

  describe "GET /encounters/new" do
    it "works!" do
      get new_encounter_path
      response.status.should be(200)
    end
  end
end
