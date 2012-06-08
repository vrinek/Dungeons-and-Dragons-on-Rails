class Encounter
  include MongoMapper::Document

  key :name, String
  key :npc_counts, Hash

  def npcs
    NonPlayerCharacter.where(id: npc_counts.select{|_,v| v.to_i != 0}.keys)
  end

  def explain_npcs
    npcs.map do |npc|
      "#{count_of(npc)}x #{npc.name}"
    end * "\n"
  end

  def count_of(npc)
    npc_counts[npc.id.to_s].to_i
  end

  def roll_initiative
    npcs.inject(Hash.new) do |hash, npc|
      hash.merge npc.name => npc.roll_initiative
    end
  end

  def total_xp
    npcs.reduce(0) do |total, npc|
      npc.xp_value.to_i * npc_counts[npc.id.to_s].to_i + total
    end
  end

  def split_xp(split)
    # splits the total xp and rounds the result by 5 (17 -> 15, 21 -> 20)
    splitted = (total_xp / split)
    return splitted - splitted % 5
  end
end
