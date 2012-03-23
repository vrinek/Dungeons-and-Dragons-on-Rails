class Encounter
  include MongoMapper::Document

  key :name, String
  key :npc_counts, Hash

  def npcs
    NonPlayerCharacter.where(:id => npc_counts.keys)
  end

  def explain_npcs
    npcs.map do |npc|
      "#{npc_counts[npc.id]}x #{npc.name}"
    end * ", "
  end
end
