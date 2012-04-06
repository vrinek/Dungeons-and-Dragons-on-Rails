require 'spec_helper'

describe "encounters/index" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter,
        :name => "Name",
        :npcs => [stub_model(NonPlayerCharacter, :id => '67', :size => 'Uber')],
        :npc_counts => {'67' => 2}
      ),
      stub_model(Encounter,
        :name => "Name",
        :npcs => [stub_model(NonPlayerCharacter, :id => '67', :size => 'Uber')],
        :npc_counts => {'67' => 2}
      )
    ])
  end

  it("works!") { render }
end
