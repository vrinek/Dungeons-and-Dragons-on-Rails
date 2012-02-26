class Character
  include MongoMapper::Document

  key :name, String
  key :level, Integer
  key :alignment, String
  ALIGNMENTS = [
    "Lawful Good", "Good", "Neutral", "Evil", "Chaotic Evil", "Unaligned"
  ]

  belongs_to :character_race

  key :strength, AbilityScore
  key :constitution, AbilityScore
  key :dexterity, AbilityScore
  key :intelligence, AbilityScore
  key :wisdom, AbilityScore
  key :charisma, AbilityScore

  def level_bonus
    level.to_i / 2
  end

  def check(ability)
    ability = case ability
    when :initiative
      :dexterity
    else
      ability
    end

    self.send(ability).modifier + level_bonus
  end
end
