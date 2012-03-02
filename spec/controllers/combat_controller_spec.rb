require 'spec_helper'

describe CombatController do

  describe "GET 'initiative'" do
    it "returns http success" do
      get 'initiative'
      response.should be_success
    end
  end

end
