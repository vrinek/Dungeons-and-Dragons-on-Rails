require "spec_helper"

describe PowersController do
  describe "routing" do

    it "routes to #index" do
      get("/powers").should route_to("powers#index")
    end

    it "routes to #new" do
      get("/powers/new").should route_to("powers#new")
    end

    it "routes to #show" do
      get("/powers/1").should route_to("powers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/powers/1/edit").should route_to("powers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/powers").should route_to("powers#create")
    end

    it "routes to #update" do
      put("/powers/1").should route_to("powers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/powers/1").should route_to("powers#destroy", :id => "1")
    end

  end
end
