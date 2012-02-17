class Character
  include MongoMapper::Document

  key :name, String
  key :level, Integer
  key :alignment, String
  ALIGNMENTS = ["Lawful Good", "Good", "Neutral", "Evil", "Chaotic Evil"]

  key :character_race_code, String

  key :strength, AbilityScore
  key :constitution, AbilityScore
  key :dexterity, AbilityScore
  key :intelligence, AbilityScore
  key :wisdom, AbilityScore
  key :charisma, AbilityScore

  def initiative
    dexterity.modifier + level_bonus
  end

  def level_bonus
    level.to_i / 2
  end
end
