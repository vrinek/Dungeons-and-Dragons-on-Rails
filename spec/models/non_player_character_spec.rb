require 'spec_helper'

describe NonPlayerCharacter do
  it "understands character role" do
    NonPlayerCharacter.new(character_role: "Minion")
  end

  it "understands xp value" do
    NonPlayerCharacter.new(xp_value: 100)
  end
end
