class Character
  include MongoMapper::Document

  key :name, String
  validates_presence_of :name

  key :level, Integer, default: 1
  validates_presence_of :level

  key :alignment, String
  ALIGNMENTS = [
    "Lawful Good", "Good", "Neutral", "Evil", "Chaotic Evil", "Unaligned"
  ]

  key :size, String
  validates_presence_of :size
  SIZES = %w[tiny small medium large huge]

  belongs_to :character_race

  key :strength,     AbilityScore, default: 10
  key :constitution, AbilityScore, default: 10
  key :dexterity,    AbilityScore, default: 10
  key :intelligence, AbilityScore, default: 10
  key :wisdom,       AbilityScore, default: 10
  key :charisma,     AbilityScore, default: 10

  key :health_points, Integer
  key :armor_class, Integer
  key :fortitude, Integer
  key :reflex, Integer
  key :will, Integer
  key :speed, Integer

  key :languages, Array
  LANGUAGES = [
    "Common", "Deep Speech", "Draconic", "Dwarven", "Elven", "Goblin", "Giant",
    "Primordial"
  ]

  SKILLS = {
    initiative: :dexterity,
    perception: :wisdom
  }

  def level_bonus
    level.to_i / 2
  end

  def bloodied_hp
    health_points.to_i / 2
  end

  # ability and skill checks
  def check(ability_or_skill)
    ability = (SKILLS[ability_or_skill] or ability_or_skill)

    self.send(ability).modifier + level_bonus
  end
end
