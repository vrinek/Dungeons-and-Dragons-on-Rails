require "spec_helper"

describe InsiderDataController do
  describe "routing" do

    it "routes to #index" do
      get("/insider_data").should route_to("insider_data#index")
    end

    it "routes to #new" do
      get("/insider_data/new").should route_to("insider_data#new")
    end

    it "routes to #show" do
      get("/insider_data/1").should route_to("insider_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/insider_data/1/edit").should route_to("insider_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/insider_data").should route_to("insider_data#create")
    end

    it "routes to #update" do
      put("/insider_data/1").should route_to("insider_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/insider_data/1").should route_to("insider_data#destroy", :id => "1")
    end

    it "routes to #fetch" do
      get("/insider_data/fetch").should route_to("insider_data#fetch")
    end

  end
end
