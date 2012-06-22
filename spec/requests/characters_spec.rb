require 'spec_helper'

describe "Characters" do
  describe "GET /characters" do
    before(:each) do
      FactoryGirl.create_list(:player, 2)
      FactoryGirl.create_list(:npc, 5)
    end

    it "works!" do
      get characters_path
      response.status.should be(200)
    end
  end

  describe "DELETE /characters/:id" do
    let(:character_to_delete) { FactoryGirl.create :player }

    before(:each) do
      FactoryGirl.create_list(:player, 2)
      FactoryGirl.create_list(:npc, 5)
      character_to_delete
    end

    it "works!" do
      delete character_path(character_to_delete)
    end

    it "deletes the character" do
      expect {
        delete character_path(character_to_delete)
      }.to change {
        Character.where(id: character_to_delete.id).first
      }.to(nil)
    end

    it "deletes only one character" do
      expect {
        delete character_path(character_to_delete)
      }.to change {
        Character.count
      }.by(-1)
    end
  end
end
