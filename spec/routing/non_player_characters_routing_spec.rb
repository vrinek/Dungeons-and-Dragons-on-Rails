require "spec_helper"

describe NonPlayerCharactersController do
  describe "routing" do

    it "routes to #new" do
      get("/non_player_characters/new").should route_to("non_player_characters#new")
    end

    it "routes to #show" do
      get("/non_player_characters/1").should route_to("non_player_characters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/non_player_characters/1/edit").should route_to("non_player_characters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/non_player_characters").should route_to("non_player_characters#create")
    end

    it "routes to #update" do
      put("/non_player_characters/1").should route_to("non_player_characters#update", :id => "1")
    end

  end
end
