class Encounter
  include MongoMapper::Document

  key :name, String
  key :npc_counts, Hash

  def npcs
    NonPlayerCharacter.where(:id => npc_counts.keys)
  end

  def explain_npcs
    npcs.map do |npc|
      "#{count_of(npc)}x #{npc.name}"
    end * ", "
  end

  def count_of(npc)
    npc_counts[npc.id.to_s].to_i
  end

  def roll_initiative
    npcs.inject(Hash.new) do |hash, npc|
      hash.merge npc.name => npc.roll_initiative
    end
  end
end
