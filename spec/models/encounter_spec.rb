require 'spec_helper'

describe Encounter do
  subject { FactoryGirl.create(:encounter) }

  it { should respond_to(:explain_npcs) }
  it { should respond_to(:count_of) }
  it { should respond_to(:roll_initiative) }

  its(:roll_initiative) { should be_a(Hash) }
end
