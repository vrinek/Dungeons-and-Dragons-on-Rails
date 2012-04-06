require 'set'

SIZES = %w[
  Tiny Small Medium Large Huge Gargantuan
]

ROLES = Set.new %w[
  Artillery Brute Controller Lurker Skirmisher Soldier
]

SUB_ROLES = Set.new %w[
  Leader Minion Elite Solo
]

ORIGINS = Set.new %w[
  Aberrant Elemental Fey Immortal Natural Shadow
]

MONSTER_TYPES = Set.new [
  "Animate", "Beast", "Humanoid", "Magical Beast"
]

KEYWORDS = Set.new [
  "Acid", "Air", "Angel", "Aquatic",
  "Charm", "Cold", "Conjuration", "Construct",
  "Demon", "Devil", "Disease", "Dragon",
  "Earth",
  "Fear", "Fire", "Force",
  "Gaze", "Giant",
  "Healing", "Homunculus",
  "Illusion",
  "Lightning", "Living Construct",
  "Mount",
  "Necrotic",
  "Ooze",
  "Poison", "Polymorph", "Plant", "Psychic",
  "Radiant", "Reptile",
  "Shapechanger", "Sleep", "Spider", "Swarm",
  "Teleportation", "Thunder",
  "Undead",
  "Water",
  "Zone"
]

SENSES = Set.new [
  "All-Around Vision", "Blind", "Blindsight", "Darkvision", "Low-Light Vision",
  "Tremorsense", "Truesight"
]

SKILLS = Set.new %w[
  Athletics

  Acrobatics
  Stealth
  Thievery

  Dungeoneering
  Heal
  Insight
  Perception

  Endurance

  Arcana
  History
  Nature
  Religion

  Bluff
  Diplomacy
  Intimidate
  Streetwise
]

SKILLS = {
  initiative: :dexterity,

  athletics: :strength,

  acrobatics: :dexterity,
  stealth: :dexterity,
  thievery: :dexterity,

  dungeoneering: :wisdom,
  heal: :wisdom,
  insight: :wisdom,
  perception: :wisdom,

  endurance: :constitution,

  arcana: :intelligence,
  history: :intelligence,
  nature: :intelligence,
  religion: :intelligence,

  bluff: :charisma,
  diplomacy: :charisma,
  intimidate: :charisma,
  streetwise: :charisma
}

LANGUAGES = Set.new [
  "Abyssal", "Common", "Deep Speech", "Draconic", "Dwarven", "Elven", "Giant",
  "Goblin", "Primordial", "Supernal"
]

SCRIPTS = Set.new %w[
  Script Rellanic Iokharic Davek Barazhad
]

ALIGNMENTS = [
  "Any",
  "Chaotic Evil", "Evil", "Good", "Lawful Good",
  "Unaligned"
]
