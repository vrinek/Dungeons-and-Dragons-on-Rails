class Encounter
  include MongoMapper::Document

  key :name, String
  key :npcs, Hash

  def explain_npcs
    npcs.map do |npc_id, count|
      npc = NonPlayerCharacter.find(npc_id)
      "#{count}x #{npc.name}"
    end * ", "
  end
end
