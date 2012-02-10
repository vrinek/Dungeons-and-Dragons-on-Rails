require "spec_helper"

describe CharactersController do
  describe "routing" do

    it "routes to #index" do
      get("/characters").should route_to("characters#index")
    end

    it "routes to #new" do
      get("/characters/new").should route_to("characters#new")
    end

    it "routes to #show" do
      get("/characters/1").should route_to("characters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/characters/1/edit").should route_to("characters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/characters").should route_to("characters#create")
    end

    it "routes to #update" do
      put("/characters/1").should route_to("characters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/characters/1").should route_to("characters#destroy", :id => "1")
    end

  end
end
