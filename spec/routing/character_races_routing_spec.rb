require "spec_helper"

describe CharacterRacesController do
  describe "routing" do

    it "routes to #index" do
      get("/character_races").should route_to("character_races#index")
    end

    it "routes to #new" do
      get("/character_races/new").should route_to("character_races#new")
    end

    it "routes to #show" do
      get("/character_races/1").should route_to("character_races#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_races/1/edit").should route_to("character_races#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_races").should route_to("character_races#create")
    end

    it "routes to #update" do
      put("/character_races/1").should route_to("character_races#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_races/1").should route_to("character_races#destroy", :id => "1")
    end

  end
end
