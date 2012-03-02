require "spec_helper"

describe EncountersController do
  describe "routing" do

    it "routes to #index" do
      get("/encounters").should route_to("encounters#index")
    end

    it "routes to #new" do
      get("/encounters/new").should route_to("encounters#new")
    end

    it "routes to #show" do
      get("/encounters/1").should route_to("encounters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/encounters/1/edit").should route_to("encounters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/encounters").should route_to("encounters#create")
    end

    it "routes to #update" do
      put("/encounters/1").should route_to("encounters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/encounters/1").should route_to("encounters#destroy", :id => "1")
    end

  end
end
